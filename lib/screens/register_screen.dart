import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:my_chef/components/login_text_field.dart';
import 'package:my_chef/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;
  String? password;

  void checkAuth() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Column(
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
                  SizedBox(height: 95),
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
                        LoginTextField(
                          hintText: 'ej@gmail.com',
                          callback: (String value) {
                            setState(() {
                              email = value;
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10),
                        LoginTextField(
                          hintText: '********',
                          obscureText: true,
                          callback: (String value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Repeat Password',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10),
                        LoginTextField(
                          hintText: '********',
                          obscureText: true,
                          callback: (String value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (email != null && password != null) {
                                      // ? try ? nav ?
                                      checkAuth();
                                    }
                                  },
                                  style: kElevatedButtonStyle.copyWith(
                                    backgroundColor: MaterialStateProperty.all(
                                      Color(0xfff0622b),
                                    ),
                                    textStyle: MaterialStateProperty.all(
                                      TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        letterSpacing: .5,
                                      ),
                                    ),
                                  ),
                                  child: Text('Register'),
                                ),
                              ),
                            ],
                          ),
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
                            Text(
                              'Log in',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xffe75841),
                                fontWeight: FontWeight.w600,
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
    );
  }
}
