import 'package:flutter/material.dart';

import 'colors.dart';

Decoration backgroundDecoration = BoxDecoration(
    boxShadow: [BoxShadow(color: mainPurple, blurRadius: 15)],
    borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(208, 211, 255, 1),
        Color.fromRGBO(208, 211, 255, 1)
      ],
    ));
