import 'package:flutter/material.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/styles/themes.dart';
import 'package:socialife/utils/date.utils.dart';
import 'package:socialife/widgets/error/error_card.dart';

class DateInput extends StatelessWidget {
  const DateInput({
    Key? key,
    this.onChange,
    this.label,
    this.placeholder,
    this.shouldShowTime = true,
    this.value,
    this.isError = false,
    this.error,
  }) : super(key: key);

  final Function(DateTime)? onChange;
  final bool shouldShowTime;
  final String? label;
  final String? placeholder;
  final DateTime? value;
  final bool isError;
  final BaseException? error;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2030, 1, 1),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: kDialogThemeData,
              child: child ?? Container(),
            );
          },
        );
        TimeOfDay? time;
        if (shouldShowTime && date != null) {
          time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: kDialogThemeData,
                child: child ?? Container(),
              );
            },
          );
        }

        if (date != null && (!shouldShowTime || time != null)) {
          if (time != null) {
            date = date.add(Duration(hours: time.hour, minutes: time.minute));
          }
          onChange?.call(date);
        }
      },
      child: SizedBox(
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
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: isError ? kErrorColor : kGray40Color),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 13,
                  horizontal: 16,
                ),
                child: Text(
                  formatDateTime(value) ?? placeholder ?? '',
                  style: TextStyle(
                    color: value != null ? Colors.white : kGray40Color,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            if (isError && error != null)
              ErrorCard(
                error: error!,
                compact: true,
              ),
          ],
        ),
      ),
    );
  }
}
