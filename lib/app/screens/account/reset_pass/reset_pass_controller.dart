import 'package:flutter/material.dart';
import 'package:my_chef/domain/repositories/auth_repository.dart';
import 'package:my_chef/app/screens/account/reset_pass/reset_pass_view.dart';
import 'package:provider/provider.dart';

class ResetPassController extends StatefulWidget {
  @override
  _ResetPassControllerState createState() => _ResetPassControllerState();
}

class _ResetPassControllerState extends State<ResetPassController> {
  String _email = '';

  Future<void> resetPassword(String email) async {
    AuthRepository firebaseAuth = context.read<AuthRepository>();
    await firebaseAuth.resetPassword(email: email);
  }

  @override
  Widget build(BuildContext context) {
    return ResetPassView(
      updateEmail: (String value) => _email = value,
      buttonCallback: () => resetPassword(_email),
      iconButtonCallback: () =>
          Navigator.pushReplacementNamed(context, '/login'),
    );
  }
}
