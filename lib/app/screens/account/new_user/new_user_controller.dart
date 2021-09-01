import 'package:flutter/material.dart';
import 'package:my_chef/app/screens/account/new_user/new_user_view.dart';
import 'package:my_chef/domain/repositories/auth_repository.dart';
import 'package:my_chef/domain/repositories/database_repository.dart';
import 'package:provider/provider.dart';

class NewUserController extends StatefulWidget {
  const NewUserController({Key? key}) : super(key: key);

  @override
  _NewUserControllerState createState() => _NewUserControllerState();
}

class _NewUserControllerState extends State<NewUserController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = '';
  String _username = '';
  String _age = '';
  String _country = '';
  bool _isUsernameValid = false;

  void updateName(String value) => _name = value;
  void updateUsername(String value) => _username = value;
  void updateAge(String value) => _age = value;
  void updateCountry(String value) => _country = value;

  String? nameValidator(value) {
    if (value.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return "Enter correct name";
    }
  }

  String? usernameValidator(value) {
    if (!_isUsernameValid) {
      return "Username already in use";
    } else if (value.isEmpty || !RegExp(r'^[a-z_A-Z0-9]+$').hasMatch(value)) {
      return "Only use letters, numbers, underscores";
    }
  }

  String? ageValidator(value) {
    if (value.isEmpty ||
        !RegExp(r'^[0-9]+$').hasMatch(value) ||
        int.parse(value) > 100 ||
        int.parse(value) < 0) {
      return "Enter correct age";
    }
  }

  Future<void> onPressedButton() async {
    await validateUsername(_username);
    if (_formKey.currentState!.validate() && _country.isNotEmpty) {
      // ! Change country format
      createUser();
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  void createUser() {
    // ? works but could be better

    final AuthRepository auth = context.read<AuthRepository>();
    final email = auth.currentUserEmail();
    final uid = auth.currentUserId();

    final DatabaseRepository firestore = context.read<DatabaseRepository>();

    Map<String, dynamic> document = {
      'uid': uid,
      'name': _name,
      'username': _username,
      'email': email,
      'age': _age,
      'country': _country,
    };

    firestore.createDocument('/users', _username, document);
  }

  // ! Check after leaving textfield
  Future<void> validateUsername(String username) async {
    final DatabaseRepository firestore = context.read<DatabaseRepository>();
    final bool? isValid = await firestore.validateUsername(username);
    print(isValid);
    setState(() {
      _isUsernameValid = isValid ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NewUserView(
      formKey: _formKey,
      updateName: updateName,
      updateUsername: updateUsername,
      updateAge: updateAge,
      updateCountry: updateCountry,
      nameValidator: nameValidator,
      usernameValidator: usernameValidator,
      ageValidator: ageValidator,
      onPressedButton: onPressedButton,
    );
  }
}
