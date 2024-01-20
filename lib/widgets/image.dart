import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 150, height: 150, child: Image.network(fit: BoxFit.cover, ""));
  }
}
