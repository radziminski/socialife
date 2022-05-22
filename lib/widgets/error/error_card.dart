import 'package:flutter/material.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/styles/colors.dart';

class ErrorCard extends StatelessWidget {
  final BaseException error;
  final Function()? onReload;
  final bool compact;
  const ErrorCard({
    Key? key,
    this.error = const UnknownException(),
    this.onReload,
    this.compact = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            error.icon ?? Icons.error,
            size: 22,
            color: kErrorColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                error.title,
                style: const TextStyle(
                  color: kErrorColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (error.description != null)
                Text(
                  error.description!,
                  style: const TextStyle(
                    color: kGray50Color,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
          ),
          if (onReload != null)
            const SizedBox(
              width: 5,
            ),
          if (onReload != null)
            IconButton(
              onPressed: onReload,
              icon: const Icon(
                Icons.refresh,
                color: kGray50Color,
              ),
              splashRadius: 24,
            )
        ],
      );
    }

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: error.description != null ? 100 : 80,
            width: MediaQuery.of(context).size.width * 0.95,
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    error.icon ?? Icons.error,
                    size: 36,
                    color: kErrorColor,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        error.title,
                        style: const TextStyle(
                          color: kErrorColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (error.description != null)
                        Text(
                          error.description!,
                          style: const TextStyle(
                            color: kGray50Color,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                    ],
                  ),
                  if (onReload != null)
                    const SizedBox(
                      width: 5,
                    ),
                  if (onReload != null)
                    IconButton(
                      onPressed: onReload,
                      icon: const Icon(
                        Icons.refresh,
                        color: kGray50Color,
                      ),
                      splashRadius: 24,
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
