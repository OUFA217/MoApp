import 'package:fitzapp/Components/Divider/custom_divider.dart';
import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Features/Language/language_cubit.dart';
import 'package:fitzapp/Presentation/Contact%20Us/contactUs.dart';
import 'package:fitzapp/Presentation/Langauge/language_screen.dart';
import 'package:fitzapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 15, 19, 1),
      body: Padding(
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
                SizedBox(width: 79.w),
                Text(
                  S.of(context).settings,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 23.sp,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 34.h),
            Padding(
              padding: EdgeInsets.only(left: 8.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customDivider(width: 311.w, color: const Color(0xFF2C2C2E)),
                  SizedBox(height: 18.5.h),
                  InkWell(
                    onTap: () {
                      push(context, const LanguageScreen(),
                          curves: Curves.easeOut, isSlideTransition: true);
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).language,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              color: const Color(0xFFFFFFFF)),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 36.0.w),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 18.5.h),
                  customDivider(width: 311.w, color: const Color(0xFF2C2C2E)),
                  SizedBox(height: 18.5.h),
                  InkWell(
                    onTap: () {
                      push(context, ContactUs(),
                          curves: Curves.easeOut, isSlideTransition: true);
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).contactUs,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              color: const Color(0xFFFFFFFF)),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 36.0.w),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 18.5.h),
                  customDivider(width: 311.w, color: const Color(0xFF2C2C2E)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
