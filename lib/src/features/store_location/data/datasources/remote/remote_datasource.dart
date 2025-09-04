import 'package:check_in_master/src/core/models/location_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoteDataSource {
  final FirebaseFirestore firestore;

  RemoteDataSource(this.firestore);

  Future<bool> saveLocationData(LocationDataModel locationDataModel) async {
    await firestore
        .collection('locations')
        .doc('current_location')
        .set(locationDataModel.toJson(), SetOptions(merge: true));
    return true;
  }

  Future<LocationDataModel> getLocationData() async {
    final docRef = firestore.collection('locations').doc('current_location');

    final snapshot = await docRef.get();

    if (snapshot.exists) {
      final data = snapshot.data()!;
      return LocationDataModel.fromJson(data);
    } else {
      throw Exception("No data found");
    }
  }
}
