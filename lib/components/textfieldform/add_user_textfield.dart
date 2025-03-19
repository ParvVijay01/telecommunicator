import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddUserTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  String? Function(String?)? validator;
  final bool obsecureText;
  bool readOnly;
  AddUserTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    required this.obsecureText,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        readOnly: readOnly,
        obscureText: obsecureText,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          fillColor:
              readOnly ? Colors.grey.shade300 : Theme.of(context).canvasColor,
          filled: true,
        ),
      ),
    );
  }
}
