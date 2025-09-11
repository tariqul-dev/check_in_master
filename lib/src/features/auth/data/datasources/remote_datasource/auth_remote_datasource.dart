import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../models/login_input_model.dart';
import '../../models/register_input_model.dart';
import '../../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> register(RegisterInputModel input);

  Future<UserModel> login(LoginInputModel input);

  Future<UserModel?> getCurrentUser();

  Future<void> logout();
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl({required this.auth, required this.firestore});

  @override
  Future<UserModel> register(RegisterInputModel input) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: input.email,
        password: input.password,
      );

      final uid = userCredential.user!.uid;

      final userModel = UserModel(
        name: input.name,
        email: input.email,
        checkInDateTime: null,
        checkOutDateTime: null,
      );

      await firestore.collection('users').doc(uid).set(userModel.toJson());

      return userModel;
    } on FirebaseAuthException catch (e) {
      throw Exception("Registration failed: ${e.message}");
    }
  }

  @override
  Future<UserModel> login(LoginInputModel input) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: input.email,
        password: input.password,
      );

      final uid = userCredential.user!.uid;

      final doc = await firestore.collection('users').doc(uid).get();
      if (!doc.exists) {
        throw Exception("User profile not found in Firestore");
      }

      return UserModel.fromJson(doc.data()!);
    } on FirebaseAuthException catch (e) {
      throw Exception("Login failed: ${e.message}");
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final firebaseUser = auth.currentUser;
    if (firebaseUser == null) return null;

    final doc = await firestore.collection('users').doc(firebaseUser.uid).get();
    if (!doc.exists) return null;

    return UserModel.fromJson(doc.data()!);
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
  }
}
