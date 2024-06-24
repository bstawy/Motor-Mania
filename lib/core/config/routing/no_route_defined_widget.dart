import 'package:flutter/material.dart';

class NoRouteDefinedWidget extends StatelessWidget {
  final RouteSettings settings;
  const NoRouteDefinedWidget({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            "No Route Defined for ${settings.name}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
