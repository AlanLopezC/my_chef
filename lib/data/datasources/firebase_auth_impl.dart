import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_chef/domain/repositories/auth_repository.dart';

class FirebaseAuthImpl implements AuthRepository {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }

  @override
  bool isUserVerified({required String email}) {
    User? user = _auth.currentUser;
    if (user != null) return user.emailVerified;
    print('User is null');
    return false;
  }

  @override
  Future<String?> register(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = currentUser();
      if (user != null) {
        await verifyEmail(user: user);
      }
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> verifyEmail({required User user}) async {
    try {
      await user.sendEmailVerification();
    } catch (e) {
      print(e);
    }
  }

  @override
  User? currentUser() {
    return _auth.currentUser;
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        print('No user found for that email.');
      } else {
        print(e.code);
      }
    }
  }

  @override
  String? currentUserEmail() {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.email;
    }
  }

  @override
  String? currentUserId() {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    }
  }

  @override
  Future<void> reloadUser() async {
    User? user = _auth.currentUser;
    if (user != null) user.reload();
  }
}
