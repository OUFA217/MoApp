// ignore_for_file: file_names

import 'package:fitzapp/Features/Language/language_cubit.dart';
import 'package:fitzapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:fitzapp/Components/Buttons/primary_button.dart';
import 'package:fitzapp/Constants/constants.dart';

class ContactUs extends StatelessWidget {
  ContactUs({super.key});
  final contactUsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(13, 15, 19, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: LanguageCubit.get(context).english
              ? EdgeInsets.only(left: 16.0.w, top: 64.h)
              : EdgeInsets.only(right: 16.0.w, top: 64.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0.w),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Color.fromRGBO(40, 42, 46, 1),
                      child: BackButton(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 68.w),
                    Text(
                      S.of(context).contactUs,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 23.sp,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 34.h),
              Container(
                width: 343.w,
                height: 150.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6.r)),
                    color: const Color(0xFF282A2E)),
                child: TextField(
                  controller: contactUsController,
                  style: GoogleFonts.inter(
                      color: const Color(0xFFA2A2A2),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: S.of(context).helpDescription,
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
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                S.of(context).titleDescription,
                style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFA2A2A2)),
              ),
              SizedBox(height: 24.h),
              PrimaryButton(
                  title: S.of(context).send,
                  ontap: () {
                    contactUsController.clear();
                  }),
              SizedBox(
                height: 48.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      S.of(context).or,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFFFFFFF)),
                    ),
                  ),
                  SizedBox(height: 36.5.h),
                  Padding(
                    padding: EdgeInsets.only(left: 61.67.w),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          FitzConstants.callIcon,
                          width: 32.w,
                          height: 32.h,
                        ),
                        SizedBox(width: 12.71.w),
                        Text(S.of(context).serviceNumber,
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 19.sp,
                                color: const Color(0xFFA2A2A2)))
                      ],
                    ),
                  ),
                  SizedBox(height: 36.5.h),
                  Padding(
                    padding: EdgeInsets.only(left: 61.67.w),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          FitzConstants.googleIcon,
                          width: 32.w,
                          height: 32.h,
                        ),
                        SizedBox(width: 14.71.w),
                        Text(S.of(context).serviceEmail,
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 19.sp,
                                color: const Color(0xFFA2A2A2)))
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
