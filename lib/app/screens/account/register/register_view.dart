import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:my_chef/app/screens/account/widgets/account_button.dart';
import 'package:my_chef/app/screens/account/widgets/account_text_field.dart';

class RegisterView extends StatelessWidget {
  RegisterView({
    required this.updateEmail,
    required this.updatePassword,
    required this.updateRepeatedPass,
    required this.onPressedButton,
    required this.emailValidator,
    required this.passwordValidator,
    required this.repeatedPassValidator,
    required this.formKey,
  });

  final Function updateEmail;
  final Function updatePassword;
  final Function updateRepeatedPass;
  final Function onPressedButton;
  final Function emailValidator;
  final Function passwordValidator;
  final Function repeatedPassValidator;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        //  !Use scroll controller
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              SizedBox(
                height: screenSize.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/models/Register_top.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/models/Register_bottom.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 46,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'New User?',
                              style: TextStyle(
                                fontSize: 28,
                                letterSpacing: 1,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Welcome!',
                              style: TextStyle(
                                fontSize: 36,
                                letterSpacing: 1,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Transform.translate(
                            offset: Offset(10, 5),
                            child: Image.asset(
                              'assets/models/Pizza.png',
                              width: 125,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 90),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 10),
                            AccountTextField(
                              hintText: 'ej@gmail.com',
                              callback: (String value) => updateEmail(value),
                              validator: emailValidator,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Password',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 10),
                            AccountTextField(
                              hintText: '********',
                              obscureText: true,
                              callback: (String value) => updatePassword(value),
                              validator: passwordValidator,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Repeat Password',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 10),
                            AccountTextField(
                              hintText: '********',
                              obscureText: true,
                              callback: (String value) =>
                                  updateRepeatedPass(value),
                              validator: repeatedPassValidator,
                            ),
                            SizedBox(height: 10),
                            AccountButton(
                              label: 'Register',
                              onPressed: onPressedButton,
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                            ),
                            Column(
                              children: [
                                SizedBox(width: double.infinity),
                                Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/login');
                                  },
                                  child: Text(
                                    'Log in',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffe75841),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
