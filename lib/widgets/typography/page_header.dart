import 'package:flutter/material.dart';
import 'package:socialife/widgets/layout/page_padding.dart';

class PageHeader extends StatelessWidget {
  final String title;
  const PageHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: Text(
        title,
        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
      ),
    );
  }
}
