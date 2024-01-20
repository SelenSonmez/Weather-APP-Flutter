import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({super.key, required this.temp});
  final int temp;

  @override
  Widget build(BuildContext context) {
    return Text(
      temp.toString(),
      style: TextStyle(
          letterSpacing: -15,
          fontSize: 170,
          fontWeight: FontWeight.bold,
          shadows: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5,
            )
          ],
          color: mainPurple),
    );
  }
}
