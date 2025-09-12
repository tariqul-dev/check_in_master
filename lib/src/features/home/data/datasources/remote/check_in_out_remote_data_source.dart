import 'package:check_in_master/src/core/errors/exceptions/exceptions.dart';
import 'package:check_in_master/src/core/models/location_data_model.dart';
import 'package:check_in_master/src/core/models/user_model.dart';
import 'package:check_in_master/src/features/home/data/datasources/local/eligibility_checker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

abstract class CheckInOutRemoteDataSource {
  Future<UserModel> checkIn({
    required UserModel user,
    required LocationDataModel activeLocation,
  });

  Future<UserModel> checkOut({
    required UserModel user,
    required LocationDataModel activeLocation,
  });
}

@LazySingleton(as: CheckInOutRemoteDataSource)
class CheckInOutRemoteDataSourceImpl implements CheckInOutRemoteDataSource {
  final FirebaseFirestore _firestore;
  final EligibilityChecker _eligibilityChecker;

  CheckInOutRemoteDataSourceImpl(this._firestore, this._eligibilityChecker);

  @override
  Future<UserModel> checkIn({
    required UserModel user,
    required LocationDataModel activeLocation,
  }) async {
    final isEligibleForCheckIn = await _eligibilityChecker.checkEligibility(
      activeLocation,
    );

    if (!isEligibleForCheckIn) {
      throw CheckInException('You are not in office coverage');
    }

    final userRef = _firestore.collection("users").doc(user.id);
    final locationRef = _firestore
        .collection("locations")
        .doc(activeLocation.id);
    final recordRef = _firestore.collection("checkInRecords").doc();

    final now = DateTime.now().millisecondsSinceEpoch;

    await _firestore.runTransaction((txn) async {
      txn.update(userRef, {
        "isCheckedIn": true,
        "locationId": activeLocation.id,
        "checkInDateTime": now,
        "checkOutDateTime": null,
      });

      txn.update(locationRef, {
        "checkedInUserIds": FieldValue.arrayUnion([user.id]),
      });

      txn.set(recordRef, {
        "userId": user.id,
        "locationId": activeLocation.id,
        "checkInDateTime": now,
        "checkOutDateTime": null,
      });
    });

    final updatedUser = await userRef.get();
    if (!updatedUser.exists) throw CheckInException('Updated user not found');
    return UserModel.fromFirestore(updatedUser.data()!, updatedUser.id);
  }

  @override
  Future<UserModel> checkOut({
    required UserModel user,
    required LocationDataModel activeLocation,
  }) async {
    final isNotEligibleForCheckOut = await _eligibilityChecker.checkEligibility(
      activeLocation,
    );

    if (isNotEligibleForCheckOut) {
      throw CheckOutException(
        'You are still in office coverage. Leave the office to checkout',
      );
    }

    if (!user.isCheckedIn || user.locationId == null) {
      throw CheckOutException('You did not check in yet');
    }

    final userRef = _firestore.collection("users").doc(user.id);
    final locationRef = _firestore
        .collection("locations")
        .doc(user.locationId!);

    final now = DateTime.now().millisecondsSinceEpoch;

    final recordQuery = await _firestore
        .collection("checkInRecords")
        .where("userId", isEqualTo: user.id)
        .where("locationId", isEqualTo: user.locationId)
        .where("checkOutDateTime", isNull: true)
        .limit(1)
        .get();

    if (recordQuery.docs.isEmpty) {
      throw CheckOutException('Record not found for this your user');
    }

    final recordRef = recordQuery.docs.first.reference;

    await _firestore.runTransaction((txn) async {
      txn.update(userRef, {
        "isCheckedIn": false,
        "checkOutDateTime": now,
        "locationId": null,
      });

      txn.update(locationRef, {
        "checkedInUserIds": FieldValue.arrayRemove([user.id]),
      });

      txn.update(recordRef, {"checkOutDateTime": now});
    });

    final updatedUser = await userRef.get();
    if (!updatedUser.exists) throw CheckOutException('Updated user not found');
    return UserModel.fromFirestore(updatedUser.data()!, updatedUser.id);
  }
}
