import 'package:flutter/material.dart';
import 'package:socialife/styles/colors.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: TextButton(
          style: ButtonStyle(
            alignment: Alignment.center,
            backgroundColor: MaterialStateProperty.all(kPrimaryColor),
            overlayColor: MaterialStateProperty.all(kPrimaryDarkColor),
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: const TextStyle(
              color: kBlackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
