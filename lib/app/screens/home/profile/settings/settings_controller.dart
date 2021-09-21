import 'package:flutter/material.dart';
import 'package:my_chef/app/screens/home/profile/settings/settings_view.dart';
import 'package:my_chef/domain/repositories/auth_repository.dart';
import 'package:provider/provider.dart';

class SettingsController extends StatelessWidget {
  const SettingsController({Key? key}) : super(key: key);

  Future<void> logoutOnPressed(BuildContext context) async {
    final AuthRepository auth = context.read<AuthRepository>();
    await auth.logout();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return SettingsView(logoutOnPressed: logoutOnPressed);
  }
}
