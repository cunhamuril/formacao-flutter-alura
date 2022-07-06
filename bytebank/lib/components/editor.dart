import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData? icon;
  final TextInputAction? textInputAction;

  const Editor({
    Key? key,
    required this.controller,
    required this.label,
    required this.hint,
    this.icon,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontSize: 16,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
        textInputAction: textInputAction ?? TextInputAction.done,
      ),
    );
  }
}
