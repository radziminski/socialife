import 'package:flutter/material.dart';
import 'package:socialife/styles/colors.dart';

class ButtonPrimary extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final bool isLoading;
  final IconData? icon;

  const ButtonPrimary({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
  }) : super(key: key);

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
          child: isLoading
              ? Center(
                  child: Transform.scale(
                    scale: 0.45,
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      backgroundColor: Colors.white.withOpacity(0.7),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        kPrimaryDarkColor,
                      ),
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (icon != null)
                      Icon(
                        icon,
                        color: kBlackColor,
                        size: 16,
                      ),
                    if (icon != null)
                      const SizedBox(
                        width: 8,
                      ),
                    Text(
                      label,
                      style: const TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
