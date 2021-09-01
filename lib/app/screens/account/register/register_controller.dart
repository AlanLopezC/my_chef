import 'package:flutter/material.dart';
import 'package:my_chef/domain/repositories/auth_repository.dart';
import 'package:my_chef/app/screens/account/register/register_view.dart';
import 'package:provider/provider.dart';

class RegisterController extends StatefulWidget {
  const RegisterController({Key? key}) : super(key: key);

  @override
  _RegisterControllerState createState() => _RegisterControllerState();
}

class _RegisterControllerState extends State<RegisterController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = ';';
  String _password = ';';
  String _repeatedPass = ';';

  void updateEmail(String value) => _email = value;
  void updatePassword(String value) => _password = value;
  void updateRepeatedPass(String value) => _repeatedPass = value;

  String? emailValidator(value) {
    if (value.isEmpty ||
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return "Enter correct email address";
    }
  }

  String? passwordValidator(value) {
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
  }

  String? repeatedPassValidator(value) {
    if (_password != value) {
      return "Password doesn't match";
    }
  }

  void onPressedButton() {
    if (_formKey.currentState!.validate()) {
      // ! Handle padding with errors
      registerUser(_email, _password);
    }
  }

  Future<void> registerUser(String email, String password) async {
    AuthRepository auth = context.read<AuthRepository>();
    final String? error = await auth.register(email: email, password: password);

    if (error == null) {
      Navigator.pushReplacementNamed(context, '/verify');
    } else if (error == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email already in use. Try login'),
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RegisterView(
      updateEmail: updateEmail,
      updatePassword: updatePassword,
      updateRepeatedPass: updateRepeatedPass,
      onPressedButton: onPressedButton,
      emailValidator: emailValidator,
      passwordValidator: passwordValidator,
      repeatedPassValidator: repeatedPassValidator,
      formKey: _formKey,
    );
  }
}
