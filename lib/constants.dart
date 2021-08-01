import 'package:flutter/material.dart';

final MaterialColor kPrimaryColor = Colors.teal;

final TextStyle kCreateTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

final ButtonStyle kElevatedButtonStyles = ButtonStyle(
  padding: MaterialStateProperty.all(
    EdgeInsets.all(10),
  ),
  textStyle: MaterialStateProperty.all(
    TextStyle(fontWeight: FontWeight.normal),
  ),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
  ),
  backgroundColor: MaterialStateProperty.all(Colors.tealAccent[700]),
);
