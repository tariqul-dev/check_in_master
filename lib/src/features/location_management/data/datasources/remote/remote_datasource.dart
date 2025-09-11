import 'package:check_in_master/src/core/errors/exceptions/no_data_found_exception.dart';
import 'package:check_in_master/src/core/models/location_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoteDataSource {
  final FirebaseFirestore firestore;

  RemoteDataSource(this.firestore);

  Future<LocationDataModel> saveLocationData(
    LocationDataModel locationDataModel,
    String? currentActiveLocationId,
  ) async {
    if (currentActiveLocationId != null) {
      await _updateLocationActivationById(
        id: currentActiveLocationId,
        active: false,
      );
    }
    final docRef = await firestore
        .collection('locations')
        .add(locationDataModel.toJson());

    final snapshot = await docRef.get();
    final data = snapshot.data();

    if (data == null) {
      throw Exception("Failed to save location");
    }

    return LocationDataModel.fromFirestore(docRef.id, data);
  }

  Future<String> updateActiveLocation({
    required String currentActiveLocationId,
    required String updatableLocationId,
  }) async {
    await _updateLocationActivationById(
      id: currentActiveLocationId,
      active: false,
    );
    return await _updateLocationActivationById(
      id: updatableLocationId,
      active: true,
    );
  }

  Future<String> _updateLocationActivationById({
    required String id,
    required bool active,
  }) async {
    await firestore.collection('locations').doc(id).update({'active': active});

    return id;
  }

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
