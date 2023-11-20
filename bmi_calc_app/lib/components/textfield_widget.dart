import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
  });

  final String title;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 175,
      child: TextField(
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            label: Text(title),
            hintText: hint),
      ),
    );
  }
}
