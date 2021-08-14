import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_chef/domain/repositories/auth/auth_repository.dart';
import 'package:my_chef/ui/screens/account/verify/verify_view.dart';
import 'package:my_chef/ui/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class VerifyController extends StatefulWidget {
  @override
  _VerifyControllerState createState() => _VerifyControllerState();
}

class _VerifyControllerState extends State<VerifyController> {
  late AuthRepository _firebaseAuth;
  Timer? _timer;

  @override
  void initState() {
    _firebaseAuth = context.read<AuthRepository>();

    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    // Just in case
    _timer!.cancel();
    super.dispose();
  }

  Future<void> checkEmailVerified() async {
    await _firebaseAuth.reloadUser();

    String? email = _firebaseAuth.currentUserEmail();
    if (email == null) return;

    bool isVerified = _firebaseAuth.isUserVerified(email: email);
    if (isVerified) {
      _timer!.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return VerifyView();
  }
}
