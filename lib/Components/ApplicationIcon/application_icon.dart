import 'package:fitzapp/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationIcon extends StatelessWidget {
  const ApplicationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67.h,
      width: 111.w,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          backgroundBlendMode: BlendMode.exclusion,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(FitzConstants.applicationImage))),
    );
  }
}
