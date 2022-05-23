import 'package:flutter/material.dart';
import 'package:socialife/widgets/layout/page_padding.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final bool compact;
  const PageHeader({Key? key, required this.title, this.compact = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: Text(
        title,
        style: TextStyle(
          fontSize: compact ? 24 : 32,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
