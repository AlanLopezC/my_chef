import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_chef/components/login_text_field.dart';
import 'package:my_chef/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';

  Future<void> checkAuth(String email, String password) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email, password: password);

      User? user = auth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        Navigator.pushReplacementNamed(context, '/verify');
      } else {
        Navigator.pushReplacementNamed(context, '/');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  resetPassword() {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.sendPasswordResetEmail(email: 'alan.ignacio@hotmail.com');
  }

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
                        LoginTextField(
                          hintText: 'ej@gmail.com',
                          callback: (String value) {
                            setState(() {
                              _email = value;
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
                              _password = value;
                            });
                          },
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
                            TextButton(
                              // ! Change padding
                              onPressed: () => resetPassword(),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_email != '' && _password != '') {
                                      checkAuth(_email, _password);
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
                                      ),
                                    ),
                                  ),
                                  child: Text('Log in'),
                                ),
                              ),
                            ],
                          ),
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
                            TextButton(
                              // !Change padding
                              onPressed: () {
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
    );
  }
}
