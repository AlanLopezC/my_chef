import 'package:flutter/material.dart';

class CategoriesChip extends StatelessWidget {
  const CategoriesChip({required this.label, this.isSelected = false});

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label),
        backgroundColor: isSelected ? Colors.black26 : null,
      ),
    );
  }
}
