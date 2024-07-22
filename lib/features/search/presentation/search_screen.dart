import 'package:flutter/material.dart';

import 'widgets/app_bar_search_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppBarSearchWidget(),
      ),
    );
  }
}
