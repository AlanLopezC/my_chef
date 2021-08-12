import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_chef/domain/repositories/auth/login_repository.dart';

class FirebaseLogin implements LoginRepository {
  @override
  Future<User?> login({required String email, required String password}) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email, password: password);

      return auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement doLogout
    throw UnimplementedError();
  }
}
