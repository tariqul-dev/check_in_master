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
      updateLocationActivationById(currentActiveLocationId, false);
    }
    await firestore.collection('locations').add(locationDataModel.toJson());
    return true;
  }

  Future<void> updateLocationActivationById(
    String currentActiveLocationId,
    bool active,
  ) async {
    await firestore.collection('locations').doc(currentActiveLocationId).update(
      {'active': active},
    );
  }

  Future<void> updateLocationsStatus() async {}

  Future<LocationDataModel> getActiveLocationData() async {
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

  Future<List<LocationDataModel>> getLocations() async {
    final querySnapshot = await firestore.collection('locations').get();

    if (querySnapshot.docs.isNotEmpty) {
      final locationList = querySnapshot.docs
          .map((doc) => LocationDataModel.fromFirestore(doc.id, doc.data()))
          .toList();
      return locationList;
    } else {
      throw NoDataFoundException(message: 'No data found');
    }
  }
}
