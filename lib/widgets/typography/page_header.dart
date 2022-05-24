import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/widgets/layout/page_padding.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final bool compact;
  final bool withBackButton;
  const PageHeader({
    Key? key,
    required this.title,
    this.compact = false,
    this.withBackButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: Transform.translate(
        offset: withBackButton ? const Offset(-16, 0) : const Offset(0, 0),
        child: Row(
          children: [
            if (withBackButton)
              IconButton(
                onPressed: () {
                  AutoRouter.of(context).pop();
                },
                splashRadius: 20,
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: compact ? 20 : 24,
                ),
              ),
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: compact ? 24 : 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
