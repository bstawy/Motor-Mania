import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/home_header.dart';
import 'widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Column(
            children: [
              HomeHeaderWidget(),
            ],
          ),
          Positioned(
            top: 270.h,
            left: 0,
            right: 0,
            child: const SearchBarWidget(),
          ),
        ],
      ),
    );
  }
}
