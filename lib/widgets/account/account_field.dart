import 'package:flutter/material.dart';
import 'package:socialife/styles/colors.dart';

class AccountField extends StatelessWidget {
  final String label;
  final String? value;
  const AccountField({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value != null && value!.isNotEmpty ? value! : '-',
              style: const TextStyle(
                color: kGray60Color,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
