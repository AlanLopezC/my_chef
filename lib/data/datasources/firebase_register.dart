import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_chef/domain/repositories/auth/register_repository.dart';

class FirebaseRegister implements RegisterRepository {
  @override
  Future<void> register(
      {required String email, required String password}) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = auth.currentUser;
      if (user != null) {
        await user.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      // ! Handle errors
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
