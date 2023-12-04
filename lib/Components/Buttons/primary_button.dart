// ignore_for_file: must_be_immutable

import 'package:fitzapp/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton(
      {super.key, required this.title, required this.ontap, this.width});
  final String? title;
  final VoidCallback? ontap;
  double? width = 343.w;
  static bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    if (isClicked == false) {
      return InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: ontap,
          child: Container(
            height: 48,
            width: width,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(246, 168, 33, 1.0),
                borderRadius: BorderRadius.all(Radius.circular(16.r))),
            child: Center(
                child: Text(
              title!,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400, fontSize: 16.sp),
            )),
          ));
    } else {
      return Container(
          height: 48,
          width: width,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(246, 168, 33, 1.0),
              borderRadius: BorderRadius.all(Radius.circular(16.r))),
          child: const Loading()
          // child: const Center(
          //     child: CircularProgressIndicator(
          //   color: Color.fromRGBO(246, 168, 33, 1.0),
          // )),
          );
    }
  }
}
