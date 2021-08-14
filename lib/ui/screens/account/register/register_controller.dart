import 'package:flutter/material.dart';
import 'package:my_chef/domain/repositories/auth/auth_repository.dart';
import 'package:my_chef/ui/screens/account/register/register_view.dart';
import 'package:provider/provider.dart';

class RegisterController extends StatefulWidget {
  const RegisterController({Key? key}) : super(key: key);

  @override
  _RegisterControllerState createState() => _RegisterControllerState();
}

class _RegisterControllerState extends State<RegisterController> {
  String _email = ';';
  String _password = ';';
  String _repeatedPass = ';';

  void updateEmail(String value) => _email = value;
  void updatePassword(String value) => _password = value;
  void updateRepeatedPass(String value) => _repeatedPass = value;
  void buttonOnPressed() {
    if (_email.isNotEmpty &&
        _password.isNotEmpty &&
        _password == _repeatedPass) {
      registerUser(_email, _password);
    }
  }

  void registerUser(String email, String password) {
    AuthRepository firebaseAuth = context.read<AuthRepository>();
    firebaseAuth.register(email: email, password: password);
    // !What if user already exists
    Navigator.pushReplacementNamed(context, '/verify');
  }

  @override
  Widget build(BuildContext context) {
    return RegisterView(
      updateEmail: updateEmail,
      updatePassword: updatePassword,
      updateRepeatedPass: updateRepeatedPass,
      onPressedButton: buttonOnPressed,
    );
  }
}
