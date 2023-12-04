import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Features/Language/language_cubit.dart';
import 'package:fitzapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 15, 19, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: LanguageCubit.get(context).english
              ? EdgeInsets.only(top: 64.h, left: 24.0.w)
              : EdgeInsets.only(top: 64.h, right: 24.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Color.fromRGBO(40, 42, 46, 1),
                    child: BackButton(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 50.w),
                  Text(
                    S.of(context).privacyPolicy,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 23.sp,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 17.h),
              Text(
                FitzConstants.titlePrivacyDescription,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.white),
              ),
              Text(
                FitzConstants.subTitlePrivacyDescription,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
