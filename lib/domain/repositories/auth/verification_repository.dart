import 'package:firebase_auth/firebase_auth.dart';

abstract class VerificationRepository {
  Future<void> verifyEmail({required User user});
  Future<bool> isVerified({required String email});
}
