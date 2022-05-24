import 'package:flutter/material.dart';
import 'package:socialife/styles/colors.dart';

class TicketField extends StatelessWidget {
  final String label;
  final String? value;
  const TicketField({
    Key? key,
    required this.label,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: kGray40Color,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        Text(
          value ?? '-',
          style: const TextStyle(
            color: kGray10Color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
