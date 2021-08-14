import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_chef/domain/repositories/auth/auth_repository.dart';
import 'package:my_chef/ui/screens/account/login/login_view.dart';
import 'package:provider/provider.dart';

class LoginController extends StatefulWidget {
  const LoginController({Key? key}) : super(key: key);

  @override
  _LoginControllerState createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {
  String _email = '';
  String _password = '';

  void updateEmail(String value) => _email = value;
  void updatePassword(String value) => _password = value;
  void onPressedButton() {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      checkAuth(_email, _password);
    }
  }

  Future<void> checkAuth(String email, String password) async {
    final AuthRepository firebaseAuth = context.read<AuthRepository>();
    await firebaseAuth.login(email: email, password: password);
    User? user = firebaseAuth.currentUser();

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      Navigator.pushReplacementNamed(context, '/verify');
    } else if (user != null) {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoginView(
        updateEmail: updateEmail,
        updatePassword: updatePassword,
        onPressedButton: onPressedButton);
  }
}
