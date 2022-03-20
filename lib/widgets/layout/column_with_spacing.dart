import 'package:flutter/material.dart';

class ColumnWithSpacing extends StatelessWidget {
  const ColumnWithSpacing({
    Key? key,
    required this.spacing,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  final double spacing;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final List<Widget> spacedChildren = [];
    for (final child in children) {
      spacedChildren.add(child);
      if (child != children.last) {
        spacedChildren.add(SizedBox(
          height: spacing,
        ));
      }
    }
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: spacedChildren,
    );
  }
}
