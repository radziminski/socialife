import 'package:flutter/material.dart';
import 'package:socialife/styles/colors.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: TextField(
          controller: controller,
          style: const TextStyle(
            fontSize: 14,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: kGray40Color,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: kGray60Color,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
          ),
        ),
      ),
    );
  }
}
