import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomizeSearch extends StatelessWidget {
  CustomizeSearch({super.key});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 311.w,
        height: 48.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            color: const Color(0xFF282A2E)),
        child: TextField(
          controller: searchController,
          style: GoogleFonts.inter(
              color: Colors.grey, fontSize: 17.sp, fontWeight: FontWeight.w400),
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
              isDense: true,
              prefixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: SvgPicture.asset(
                  FitzConstants.searchIcon,
                ),
              ),
              hintText: S.of(context).search,
              hintStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: const Color(0xFFA2A2A2)),
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(1.r)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(4.r)),
              )),
        ));
  }
}
