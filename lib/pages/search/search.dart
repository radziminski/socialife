import 'package:flutter/material.dart';
import 'package:socialife/widgets/layout/page_padding.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/typography/page_header.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          PageHeader(title: 'Search'),
          SizedBox(
            height: 30,
          ),
          PagePadding(
            child: Text(
              'SearchPage - page with input and events list - TODO',
            ),
          ),
        ],
      ),
    );
  }
}
