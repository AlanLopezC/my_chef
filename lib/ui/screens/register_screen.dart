import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:my_chef/ui/constants.dart';
import 'package:my_chef/ui/widgets/login_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email = '';
  String _password = '';
  String _repeatedPassword = '';

  Future<void> registerUser(
      String email, String password, String repeatedPassword) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = auth.currentUser;

      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
      Navigator.pushReplacementNamed(context, '/verify');
    } on FirebaseAuthException catch (e) {
      // ! Handle errors
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

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
                                _repeatedPassword = value;
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
                                      if (_email != '' &&
                                          _password != '' &&
                                          _password == _repeatedPassword) {
                                        registerUser(_email, _password,
                                            _repeatedPassword);
                                      }
                                    },
                                    style: kElevatedButtonStyle.copyWith(
                                      backgroundColor:
                                          MaterialStateProperty.all(
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
                              TextButton(
                                //! Change padding
                                onPressed: () {
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
