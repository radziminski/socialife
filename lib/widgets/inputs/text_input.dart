import 'package:flutter/material.dart';
import 'package:socialife/styles/colors.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {Key? key, required this.controller, this.label, this.placeholder})
      : super(key: key);

  final TextEditingController controller;
  final String? label;
  final String? placeholder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              label!.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.85),
              ),
            ),
          if (label != null) const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: TextField(
              controller: controller,
              style: const TextStyle(
                fontSize: 14,
              ),
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: const TextStyle(
                  color: kGray40Color,
                ),
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
        ],
      ),
    );
  }
}
