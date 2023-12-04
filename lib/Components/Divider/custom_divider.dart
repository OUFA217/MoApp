import 'package:flutter/material.dart';

Widget customDivider(
        {double width = double.infinity,
        Color color = Colors.grey,
        bool rotatedDivider = false}) =>
    RotatedBox(
      quarterTurns: rotatedDivider == true ? 3 : 0,
      child: Container(
        width: width / 1.1,
        height: 1.0,
        color: color,
      ),
    );
