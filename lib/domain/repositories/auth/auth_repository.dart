import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<void> login({required String email, required String password});
  Future<void> logout();
  Future<void> register({required String email, required String password});
  Future<void> verifyEmail({required User user});
  bool isUserVerified({required String email});
  Future<void> resetPassword({required String email});
  Future<void> reloadUser();
  User? currentUser();
  String? currentUserEmail();
}
