import 'package:check_in_master/src/core/errors/exceptions/no_data_found_exception.dart';
import 'package:check_in_master/src/core/models/location_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoteDataSource {
  final FirebaseFirestore firestore;

  RemoteDataSource(this.firestore);

  Future<bool> saveLocationData(
    LocationDataModel locationDataModel,
    String? currentActiveLocationId,
  ) async {
    if (currentActiveLocationId != null) {
      deactivateLocationById(currentActiveLocationId);
    }
    await firestore.collection('locations').add(locationDataModel.toJson());
    return true;
  }

  Future<void> deactivateLocationById(String currentActiveLocationId) async {
    await firestore.collection('locations').doc(currentActiveLocationId).update(
      {'active': false},
    );
  }

  Future<void> updateLocationsStatus() async {
    final batch = firestore.batch();

    await _runBatchUpdate(batch);

    await batch.commit();
  }

  Future<void> _runBatchUpdate(WriteBatch batch) async {
    final snapshot = await firestore.collection('locations').get();
    if (snapshot.docs.isEmpty) return;

    for (final doc in snapshot.docs) {
      batch.update(doc.reference, {'active': false});
    }
  }

  Future<LocationDataModel> getLocationData() async {
    final querySnapshot = await firestore
        .collection('locations')
        .where('active', isEqualTo: true)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final doc = querySnapshot.docs.first;
      return LocationDataModel.fromFirestore(doc.id, doc.data());
    } else {
      throw NoDataFoundException(message: 'No data found');
    }
  }
}
