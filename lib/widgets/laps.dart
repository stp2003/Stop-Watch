import 'package:flutter/material.dart';

class Laps extends StatelessWidget {
  const Laps({
    super.key,
    required this.laps,
    required this.index,
  });

  final List laps;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Lap: ${index + 1}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              Text(
                "${laps[index]}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
