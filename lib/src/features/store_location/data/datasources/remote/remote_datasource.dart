import 'package:check_in_master/src/core/errors/exceptions/no_data_found_exception.dart';
import 'package:check_in_master/src/core/models/location_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoteDataSource {
  final FirebaseFirestore firestore;

  RemoteDataSource(this.firestore);

  Future<bool> saveLocationData(LocationDataModel locationDataModel) async {
    final batch = firestore.batch();

    await _runBatchUpdate(batch);

    final newDoc = firestore.collection('locations').doc();
    batch.set(newDoc, locationDataModel.toJson());

    await batch.commit();
    return true;
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
      final data = querySnapshot.docs.first.data();
      return LocationDataModel.fromJson(data);
    } else {
      throw NoDataFoundException(message: 'No data found');
    }
  }
}
