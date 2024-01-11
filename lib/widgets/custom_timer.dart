import 'package:flutter/material.dart';

class CustomTimer extends StatelessWidget {
  const CustomTimer({
    super.key,
    required this.digitHours,
    required this.digitMinutes,
    required this.digitSeconds,
  });

  final String digitHours;
  final String digitMinutes;
  final String digitSeconds;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$digitHours:$digitMinutes:$digitSeconds",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 82.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
