import 'package:check_in_master/src/core/errors/exceptions/exceptions.dart';
import 'package:check_in_master/src/core/models/location_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

abstract class LocationRemoteDataSource {
  Future<LocationDataModel> saveLocationData({
    required LocationDataModel locationDataModel,
    required String? currentActiveLocationId,
  });

  Future<String> updateActiveLocation({
    required String currentActiveLocationId,
    required String updatableLocationId,
  });

  Future<LocationDataModel> getActiveLocationData();

  Future<List<LocationDataModel>> getLocations();
}

@Injectable(as: LocationRemoteDataSource)
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final FirebaseFirestore firestore;

  LocationRemoteDataSourceImpl(this.firestore);

  @override
  Future<LocationDataModel> saveLocationData({
    required LocationDataModel locationDataModel,
    required String? currentActiveLocationId,
  }) async {
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
      throw CreatingLocationException("Failed to save location");
    }

    return LocationDataModel.fromFirestore(docRef.id, data);
  }

  @override
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

  @override
  Future<LocationDataModel> getActiveLocationData() async {
    final querySnapshot = await firestore
        .collection('locations')
        .where('active', isEqualTo: true)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final doc = querySnapshot.docs.first;
      return LocationDataModel.fromFirestore(doc.id, doc.data());
    } else {
      throw NoDataFoundException('No data found');
    }
  }

  @override
  Future<List<LocationDataModel>> getLocations() async {
    final querySnapshot = await firestore.collection('locations').get();

    if (querySnapshot.docs.isNotEmpty) {
      final locationList = querySnapshot.docs
          .map((doc) => LocationDataModel.fromFirestore(doc.id, doc.data()))
          .toList();
      return locationList;
    } else {
      throw NoDataFoundException('No data found');
    }
  }

  Future<String> _updateLocationActivationById({
    required String id,
    required bool active,
  }) async {
    await firestore.collection('locations').doc(id).update({'active': active});

    return id;
  }
}
