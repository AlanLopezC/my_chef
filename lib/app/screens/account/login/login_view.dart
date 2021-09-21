import 'package:flutter/material.dart';
import 'package:my_chef/app/screens/account/widgets/account_button.dart';
import 'package:my_chef/app/screens/account/widgets/account_text_field.dart';

class LoginView extends StatelessWidget {
  LoginView({
    required this.updateEmail,
    required this.updatePassword,
    required this.onPressedButton,
    required this.onBackPressed,
  });

  final Function updateEmail;
  final Function updatePassword;
  final Function onPressedButton;
  final Future<bool> Function()? onBackPressed;

  @override
  Widget build(BuildContext context) {
    // ! Do this with all account views
    // ! rounded_loading_button pluggin
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/models/Login_top.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/models/Login_bottom.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 50,
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
                              'Welcome',
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'back!',
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Transform.translate(
                            offset: Offset(20, 5),
                            child: Image.asset(
                              'assets/models/Pizza.png',
                              width: 125,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 110),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Forgot your password?',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/reset_pass',
                                  );
                                },
                                child: Text(
                                  'Reset password',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xffe75841),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AccountButton(
                            label: 'Log in',
                            onPressed: onPressedButton,
                          ),
                          Column(
                            children: [
                              SizedBox(width: double.infinity),
                              Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/register');
                                },
                                child: Text(
                                  'Create one',
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
