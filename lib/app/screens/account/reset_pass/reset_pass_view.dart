import 'package:flutter/material.dart';
import 'package:my_chef/app/screens/account/widgets/account_button.dart';
import 'package:my_chef/app/screens/account/widgets/account_text_field.dart';

class ResetPassView extends StatelessWidget {
  const ResetPassView({
    required this.updateEmail,
    required this.buttonCallback,
    required this.iconButtonCallback,
  });

  final Function updateEmail;
  final Function buttonCallback;
  final iconButtonCallback;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        // ! Scroll Controller
        child: SizedBox(
          height: screenSize.height,
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
                  Container(
                    margin: EdgeInsets.all(40),
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
                        AccountButton(
                          label: 'Reset Password',
                          onPressed: buttonCallback,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/models/Login_bottom.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Positioned(
                top: 40,
                left: 20,
                child: IconButton(
                  onPressed: iconButtonCallback,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
