import 'package:fitzapp/Components/Buttons/primary_button.dart';
import 'package:fitzapp/Components/Divider/custom_divider.dart';
import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Features/Language/language_cubit.dart';
import 'package:fitzapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key, required this.fullName, required this.email});
  final fullName;
  final email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 15, 19, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: LanguageCubit.get(context).english
                      ? EdgeInsets.only(top: 64.h, left: 24.w)
                      : EdgeInsets.only(top: 64.h, right: 24.w),
                  child: const CircleAvatar(
                    backgroundColor: Color.fromRGBO(40, 42, 46, 1),
                    child: BackButton(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                    width: LanguageCubit.get(context).english ? 71.w : 31.w),
                Padding(
                  padding: EdgeInsets.only(
                    top: 64.h,
                  ),
                  child: Text(
                    S.of(context).editProfile,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 23.sp,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 34.h),
            Center(
              child: CircleAvatar(
                  radius: 60.r,
                  backgroundColor: const Color.fromRGBO(40, 42, 46, 1),
                  child: SvgPicture.asset(
                    FitzConstants.profilePicture,
                  )),
            ),
            SizedBox(height: 64.h),
            Padding(
              padding: LanguageCubit.get(context).english
                  ? EdgeInsets.only(left: 32.0.w)
                  : EdgeInsets.only(right: 32.0.w),
              child: customDivider(
                  width: 311.w, color: const Color.fromRGBO(44, 44, 46, 1)),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: LanguageCubit.get(context).english
                  ? EdgeInsets.only(left: 32.0.w)
                  : EdgeInsets.only(right: 32.0.w),
              child: Text(
                S.of(context).name,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: const Color(0xFFF6A821)),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: LanguageCubit.get(context).english
                  ? EdgeInsets.only(left: 32.0.w)
                  : EdgeInsets.only(right: 32.0.w),
              child: Text(
                fullName,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: const Color(0xFFFFFFFF)),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: LanguageCubit.get(context).english
                  ? EdgeInsets.only(left: 32.0.w)
                  : EdgeInsets.only(right: 32.0.w),
              child: customDivider(
                  width: 311.w, color: const Color.fromRGBO(44, 44, 46, 1)),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: LanguageCubit.get(context).english
                  ? EdgeInsets.only(left: 32.0.w)
                  : EdgeInsets.only(right: 32.0.w),
              child: Text(
                S.of(context).email,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: const Color(0xFFF6A821)),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: LanguageCubit.get(context).english
                  ? EdgeInsets.only(left: 32.0.w)
                  : EdgeInsets.only(right: 32.0.w),
              child: Text(
                email,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: const Color(0xFFFFFFFF)),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: LanguageCubit.get(context).english
                  ? EdgeInsets.only(left: 32.0.w)
                  : EdgeInsets.only(right: 32.0.w),
              child: customDivider(
                  width: 311.w, color: const Color.fromRGBO(44, 44, 46, 1)),
            ),
            SizedBox(
              height: 237.h,
            ),
            Center(
                child: PrimaryButton(title: S.of(context).save, ontap: () {}))
          ],
        ),
      ),
    );
  }
}
