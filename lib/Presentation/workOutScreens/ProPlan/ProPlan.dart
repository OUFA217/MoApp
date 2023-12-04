// ignore_for_file: must_be_immutable

import 'package:fitzapp/Components/Divider/custom_divider.dart';
import 'package:fitzapp/Components/WeeklyWorkOutPlan/weekly_workout.dart';
import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Features/Authentication/SignIn/sign_in_cubit.dart';
import 'package:fitzapp/Features/Authentication/SignIn/sign_in_states.dart';
import 'package:fitzapp/Features/Language/language_cubit.dart';
import 'package:fitzapp/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProPlan extends StatelessWidget {
  const ProPlan({super.key, required this.programName});
  final String programName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit()..changeButtonState(),
      child: BlocBuilder<SignInCubit, InitialSignInState>(
          builder: (context, state) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(13, 15, 19, 1),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 375.w,
                      height: 268.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          opacity: 0.7,
                          fit: BoxFit.none,
                          image: AssetImage(FitzConstants.workOutPlanAppBar),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24.w, right: 24.w, top: 64.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Color.fromRGBO(13, 15, 19, 1),
                                child: Padding(
                                  padding: LanguageCubit.get(context).english
                                      ? EdgeInsets.only(left: 5.w)
                                      : EdgeInsets.only(right: 5.w),
                                  child: IconButton(
                                    icon: const Icon(Icons.arrow_back_ios,
                                        size: 25, color: Colors.white),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ),
                              const Spacer(),
                              CircleAvatar(
                                backgroundColor: Color.fromRGBO(13, 15, 19, 1),
                                child: IconButton(
                                  icon: const Icon(Icons.more_horiz,
                                      color: Colors.amber),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 39.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40.r),
                                  // topRight: Radius.circular(40.r),
                                  topLeft: Radius.circular(40.r),
                                ),
                              ),
                              child: Padding(
                                padding: LanguageCubit.get(context).english
                                    ? EdgeInsets.only(top: 20.0.h, left: 16.w)
                                    : EdgeInsets.only(top: 20.0.h, right: 16.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      S.of(context).pro3WorkPlanTitle,
                                      style: GoogleFonts.poppins(
                                          fontSize: 23.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      S.of(context).pro3WorkPlanSubTitle,
                                      style: GoogleFonts.inter(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFFA2A2A2),
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    Text(
                                      S.of(context).days30,
                                      style: GoogleFonts.inter(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFFFFFF),
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Container(
                                      constraints:
                                          const BoxConstraints(maxWidth: 327),
                                      child: Text(
                                        S
                                            .of(context)
                                            .workOutPlanBeginnerDescription,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFFA2A2A2),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 14.h),
                                    customDivider(
                                      width: 327.w,
                                      color: const Color(0xFF2E343F),
                                    ),
                                    SizedBox(height: 14.h),
                                    Container(
                                      constraints:
                                          const BoxConstraints(maxWidth: 327),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                S.of(context).level,
                                                style: GoogleFonts.inter(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xFFA2A2A2)),
                                              ),
                                              SizedBox(height: 8.h),
                                              Text(
                                                programName.toString(),
                                                style: GoogleFonts.inter(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          customDivider(
                                            rotatedDivider: true,
                                            width: 35.h,
                                            color: const Color(0xFF2E343F),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                S.of(context).days,
                                                style: GoogleFonts.inter(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xFFA2A2A2)),
                                              ),
                                              SizedBox(height: 8.h),
                                              Text(
                                                S.of(context).number30,
                                                style: GoogleFonts.inter(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          customDivider(
                                            rotatedDivider: true,
                                            width: 35.h,
                                            color: const Color(0xFF2E343F),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                S.of(context).focusArea,
                                                style: GoogleFonts.inter(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xFFA2A2A2)),
                                              ),
                                              SizedBox(height: 8.h),
                                              Text(
                                                S.of(context).chest,
                                                style: GoogleFonts.inter(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 14.h),
                                    customDivider(
                                        width: 327.w,
                                        color: const Color(0xFF2E343F)),
                                    WeeklyWorkOut(
                                      is6days: true,
                                      programName: programName,
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
