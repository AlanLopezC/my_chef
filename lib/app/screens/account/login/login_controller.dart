import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_chef/app/screens/account/login/login_view.dart';
import 'package:my_chef/domain/repositories/auth_repository.dart';
import 'package:my_chef/domain/repositories/database_repository.dart';
import 'package:provider/provider.dart';

class LoginController extends StatefulWidget {
  const LoginController({Key? key}) : super(key: key);

  @override
  _LoginControllerState createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {
  String _email = '';
  String _password = '';
  bool _isNewUser = false;

  void updateEmail(String value) => _email = value;
  void updatePassword(String value) => _password = value;

  void onPressedButton() {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      checkAuth(_email, _password);
    }
  }

  Future<void> checkAuth(String email, String password) async {
    final AuthRepository auth = context.read<AuthRepository>();
    await auth.logout();
    await auth.login(email: email, password: password);
    User? user = auth.currentUser();

    String? uid = auth.currentUserId();
    checkIsNew(uid);

    if (user != null) {
      if (!user.emailVerified) {
        await user.sendEmailVerification();
        Navigator.pushReplacementNamed(context, '/verify');
      } else if (_isNewUser) {
        Navigator.pushReplacementNamed(context, '/new_user');
      } else {
        Navigator.pushReplacementNamed(context, '/');
      }
    } else {
      // ! doesnt show with keyboard
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect email or password'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> checkIsNew(dynamic uid) async {
    final DatabaseRepository firestore = context.read<DatabaseRepository>();
    _isNewUser = await firestore.querieNewUser(uid) ?? true;
  }

  Future<bool> onBackPressed() {
    // this line exits the app.
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return LoginView(
      updateEmail: updateEmail,
      updatePassword: updatePassword,
      onPressedButton: onPressedButton,
      onBackPressed: onBackPressed,
    );
  }
}
