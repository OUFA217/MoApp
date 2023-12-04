// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgramCard extends StatelessWidget {
  ProgramCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.workImage,
      this.ontap});
  final String workImage;
  final String title;
  final String subTitle;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: ontap,
      child: Stack(children: [
        Card(
          color: Colors.transparent,
          child: Container(
            width: 327,
            height: 160,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                image: DecorationImage(
                    image: AssetImage(workImage), opacity: 0.8)),
          ),
        ),
        Positioned(
          top: 91.h,
          left: 21.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                subTitle,
                style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
