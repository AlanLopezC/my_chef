import 'package:flutter/material.dart';
import 'package:my_chef/ui/constants.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({
    required this.label,
    required this.onPressed,
  });

  final String label;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
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
