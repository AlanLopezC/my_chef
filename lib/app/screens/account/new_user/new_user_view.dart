import 'package:flutter/material.dart';
import 'package:my_chef/app/screens/account/widgets/account_button.dart';
import 'package:my_chef/app/screens/account/widgets/account_text_field.dart';

class NewUserView extends StatelessWidget {
  NewUserView({
    required this.updateName,
    required this.updateUsername,
    required this.updateAge,
    required this.updateCountry,
    required this.nameValidator,
    required this.usernameValidator,
    required this.ageValidator,
    required this.onPressedButton,
    required this.formKey,
  });

  final Function updateName;
  final Function updateUsername;
  final Function updateAge;
  final Function updateCountry;
  final Function nameValidator;
  final Function usernameValidator;
  final Function ageValidator;
  final Function onPressedButton;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* Remove scaffold
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 100),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'One more step...',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 36,
                    color: Color(0xfff0622b),
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                AccountTextField(
                  hintText: 'Michael Phelps',
                  callback: (String value) => updateName(value),
                  validator: nameValidator,
                ),
                SizedBox(height: 10),
                Text(
                  'Username',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                AccountTextField(
                  hintText: 'example_123',
                  callback: (String value) => updateUsername(value),
                  validator: usernameValidator,
                ),
                SizedBox(height: 10),
                Text(
                  'Age',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                AccountTextField(
                  hintText: '32',
                  callback: (String value) => updateAge(value),
                  validator: ageValidator,
                ),
                SizedBox(height: 10),
                Text(
                  'Country',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                // ! Give options
                AccountTextField(
                  hintText: 'USA',
                  callback: (String value) => updateCountry(value),
                ),
                SizedBox(height: 10),
                AccountButton(
                  label: 'Create User',
                  onPressed: onPressedButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
