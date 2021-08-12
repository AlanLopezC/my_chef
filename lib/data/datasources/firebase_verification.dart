import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_chef/domain/repositories/auth/verification_repository.dart';

class FirebaseVerification implements VerificationRepository {
  @override
  Future<void> verifyEmail({required User user}) async {
    await user.sendEmailVerification();
  }

  @override
  Future<bool> isVerified({required String email}) {
    // TODO: implement isVerified
    throw UnimplementedError();
  }
}
