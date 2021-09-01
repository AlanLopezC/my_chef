import 'package:flutter/material.dart';
import 'package:my_chef/app/constants.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({
    required this.label,
    required this.onPressed,
    this.padding,
  });

  final String label;
  final onPressed;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onPressed,
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
              child: Text(label),
            ),
          ),
        ],
      ),
    );
  }
}
