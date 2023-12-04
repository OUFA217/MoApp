// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitzapp/Components/Buttons/primary_button.dart';
import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Features/Authentication/SignIn/sign_in_cubit.dart';
import 'package:fitzapp/Features/Authentication/SignIn/sign_in_states.dart';
import 'package:fitzapp/Features/Exercises/getExercises.dart';
import 'package:fitzapp/Features/Language/language_cubit.dart';
import 'package:fitzapp/Presentation/ExerciesesDay/exercises_day.dart';
import 'package:fitzapp/Presentation/Subscribtion/subscribtion.dart';
import 'package:fitzapp/generated/l10n.dart';
import 'package:fitzapp/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WeeklyWorkOut extends StatelessWidget {
  WeeklyWorkOut({super.key, required this.programName, required this.is6days});
  String programName;
  bool? is6days;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, InitialSignInState>(
        builder: (context, state) {
      return FutureBuilder<DocumentSnapshot>(
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }
            if (snapshot.hasData && !snapshot.data!.exists) {
              return const Text("Document does not exist");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return Padding(
                padding: EdgeInsets.only(bottom: 10.0.h),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 15.h,
                    );
                  },
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 343.w,
                          height: is6days == true ? 580.h : 540.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF5B5B5B),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.r),
                            ),
                          ),
                          child: Padding(
                            padding: LanguageCubit.get(context).english
                                ? EdgeInsets.only(top: 16.h, left: 12.w)
                                : EdgeInsets.only(top: 16.h, right: 12.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LanguageCubit.get(context).english
                                      ? FitzConstants.weeks[index]
                                      : FitzConstants.arabicWeeks[index],
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp),
                                ),
                                SizedBox(height: 12.h),
                                InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    if (data['subscription'] == true &&
                                        data['program_name'] != "") {
                                      push(
                                          context,
                                          ExercisesDay(
                                            programName: programName,
                                            dayNumber: "",
                                          ));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        duration:
                                            const Duration(milliseconds: 750),
                                        backgroundColor: Colors.red,
                                        content: Text(
                                            S.of(context).accontIsntSubscribed,
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w600)),
                                      ));
                                    }
                                  },
                                  child: Container(
                                    height: 56.h,
                                    width: 319.w,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF282A2E),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.r),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 16.w, right: 16.w),
                                      child: InkWell(
                                        onTap: () {
                                          if (data['subscription'] == true &&
                                              data['program_name'] != "") {
                                            push(
                                                context,
                                                ExercisesDay(
                                                  programName: programName,
                                                  dayNumber: FitzConstants.day1,
                                                ));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              duration: const Duration(
                                                  milliseconds: 750),
                                              backgroundColor: Colors.red,
                                              content: Text(
                                                  S
                                                      .of(context)
                                                      .accontIsntSubscribed,
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ));
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              S.of(context).day1,
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 19.sp,
                                                  color: Colors.white),
                                            ),
                                            const Spacer(),
                                            const Image(
                                                image: AssetImage(
                                                    FitzConstants.dumble)),
                                            SizedBox(width: 6.w),
                                            // Text(
                                            //   S.of(context).minutes5,
                                            //   style: GoogleFonts.inter(
                                            //       fontWeight: FontWeight.w500,
                                            //       fontSize: 19.sp,
                                            //       color: Colors.white),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Container(
                                  height: 56.h,
                                  width: 319.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF282A2E),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.r),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 16.w, right: 16.w),
                                    child: InkWell(
                                      onTap: () {
                                        if (data['subscription'] == true &&
                                            data['program_name'] != "") {
                                          push(
                                              context,
                                              ExercisesDay(
                                                  programName: programName,
                                                  dayNumber:
                                                      FitzConstants.day2));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            duration: const Duration(
                                                milliseconds: 750),
                                            backgroundColor: Colors.red,
                                            content: Text(
                                                S
                                                    .of(context)
                                                    .accontIsntSubscribed,
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 13.sp,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ));
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            S.of(context).day2,
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 19.sp,
                                                color: Colors.white),
                                          ),
                                          const Spacer(),
                                          const Image(
                                              image: AssetImage(
                                                  FitzConstants.dumble)),
                                          SizedBox(width: 6.w),
                                          // Text(
                                          //   S.of(context).minutes5,
                                          //   style: GoogleFonts.inter(
                                          //       fontWeight: FontWeight.w500,
                                          //       fontSize: 19.sp,
                                          //       color: Colors.white),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Container(
                                  height: 56.h,
                                  width: 319.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF282A2E),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.r),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 16.w, right: 16.w),
                                    child: InkWell(
                                      onTap: () {},
                                      child: InkWell(
                                        onTap: () {
                                          if (data['subscription'] == true &&
                                              data['program_name'] != "") {
                                            push(
                                                context,
                                                ExercisesDay(
                                                  programName: programName,
                                                  dayNumber: FitzConstants.day3,
                                                ));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              duration: const Duration(
                                                  milliseconds: 750),
                                              backgroundColor: Colors.red,
                                              content: Text(
                                                  S
                                                      .of(context)
                                                      .accontIsntSubscribed,
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ));
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              S.of(context).day3,
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 19.sp,
                                                  color: Colors.white),
                                            ),
                                            const Spacer(),
                                            const Image(
                                                image: AssetImage(
                                                    FitzConstants.dumble)),
                                            SizedBox(width: 6.w),
                                            // Text(
                                            //   S.of(context).minutes5,
                                            //   style: GoogleFonts.inter(
                                            //       fontWeight: FontWeight.w500,
                                            //       fontSize: 19.sp,
                                            //       color: Colors.white),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Container(
                                  height: 56.h,
                                  width: 319.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF282A2E),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.r),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 16.w, right: 16.w),
                                    child: InkWell(
                                      onTap: () {
                                        if (data['subscription'] == true &&
                                            data['program_name'] != "") {
                                          push(
                                              context,
                                              ExercisesDay(
                                                programName: programName,
                                                dayNumber: FitzConstants.day4,
                                              ));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            duration: const Duration(
                                                milliseconds: 750),
                                            backgroundColor: Colors.red,
                                            content: Text(
                                                S
                                                    .of(context)
                                                    .accontIsntSubscribed,
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 13.sp,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ));
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            S.of(context).day4,
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 19.sp,
                                                color: Colors.white),
                                          ),
                                          const Spacer(),
                                          const Image(
                                              image: AssetImage(
                                                  FitzConstants.dumble)),
                                          SizedBox(width: 6.w),
                                          // Text(
                                          //   S.of(context).minutes5,
                                          //   style: GoogleFonts.inter(
                                          //       fontWeight: FontWeight.w500,
                                          //       fontSize: 19.sp,
                                          //       color: Colors.white),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Container(
                                  height: 56.h,
                                  width: 319.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF282A2E),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.r),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 16.w, right: 16.w),
                                    child: InkWell(
                                      onTap: () {
                                        if (data['subscription'] == true &&
                                            data['program_name'] != "") {
                                          push(
                                              context,
                                              ExercisesDay(
                                                programName: programName,
                                                dayNumber: FitzConstants.day5,
                                              ));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            duration: const Duration(
                                                milliseconds: 750),
                                            backgroundColor: Colors.red,
                                            content: Text(
                                                S
                                                    .of(context)
                                                    .accontIsntSubscribed,
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 13.sp,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ));
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            S.of(context).day5,
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 19.sp,
                                                color: Colors.white),
                                          ),
                                          const Spacer(),
                                          const Image(
                                              image: AssetImage(
                                                  FitzConstants.dumble)),
                                          SizedBox(width: 6.w),
                                          // Text(
                                          //   S.of(context).minutes5,
                                          //   style: GoogleFonts.inter(
                                          //       fontWeight: FontWeight.w500,
                                          //       fontSize: 19.sp,
                                          //       color: Colors.white),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                is6days == true
                                    ? Container(
                                        height: 56.h,
                                        width: 319.w,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF282A2E),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12.r),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 16.w, right: 16.w),
                                          child: InkWell(
                                            onTap: () {
                                              if (data['subscription'] ==
                                                      true &&
                                                  data['program_name'] != "") {
                                                push(
                                                    context,
                                                    ExercisesDay(
                                                      programName: programName,
                                                      dayNumber:
                                                          FitzConstants.day6,
                                                    ));
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  duration: const Duration(
                                                      milliseconds: 750),
                                                  backgroundColor: Colors.red,
                                                  content: Text(
                                                      S
                                                          .of(context)
                                                          .accontIsntSubscribed,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                ));
                                              }
                                            },
                                            child: Row(
                                              children: [
                                                Text(
                                                  S.of(context).day6,
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 19.sp,
                                                      color: Colors.white),
                                                ),
                                                const Spacer(),
                                                const Image(
                                                    image: AssetImage(
                                                        FitzConstants.dumble)),
                                                SizedBox(width: 6.w),
                                                // Text(
                                                //   S.of(context).minutes5,
                                                //   style: GoogleFonts.inter(
                                                //       fontWeight:
                                                //           FontWeight.w500,
                                                //       fontSize: 19.sp,
                                                //       color: Colors.white),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),
                                SizedBox(height: is6days == true ? 12.h : 0.h),
                                is6days == true
                                    ? Container(
                                        height: 56.h,
                                        width: 319.w,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF282A2E),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12.r),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 16.w, right: 16.w),
                                          child: Row(
                                            children: [
                                              Text(
                                                S.of(context).day7,
                                                style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 19.sp,
                                                    color: Colors.white),
                                              ),
                                              const Spacer(),
                                              const Image(
                                                  image: AssetImage(
                                                      FitzConstants.dumble)),
                                              SizedBox(width: 6.w),
                                              Text(
                                                S.of(context).off,
                                                style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 19.sp,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: 56.h,
                                        width: 319.w,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF282A2E),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12.r),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 16.w, right: 16.w),
                                          child: Row(
                                            children: [
                                              Text(
                                                S.of(context).day567,
                                                style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 19.sp,
                                                    color: Colors.white),
                                              ),
                                              const Spacer(),
                                              const Image(
                                                  image: AssetImage(
                                                      FitzConstants.dumble)),
                                              SizedBox(width: 6.w),
                                              Text(
                                                S.of(context).off,
                                                style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 19.sp,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 12.h),
                                    PrimaryButton(
                                      width: 319.w,
                                      title: S.of(context).startNow,
                                      ontap: () {
                                        if (data['subscription'] == false) {
                                          // Pass the variable
                                          push(
                                              context,
                                              Subscribtion(
                                                programName: programName,
                                              ));
                                        } else {
                                          TodayExercise todayExercise =
                                              TodayExercise();

                                          todayExercise
                                              .getSameDayExercises()
                                              .then((dayNumber) {
                                            if (dayNumber != null) {
                                              push(
                                                  context,
                                                  ExercisesDay(
                                                    programName: programName,
                                                    dayNumber: "Day $dayNumber",
                                                  ));
                                              // You can use the dayNumber value here or pass it to another function or screen.
                                            } else {}
                                          });
                                        }
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: 4,
                ),
              );
            } else {
              return Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Loading(),
                ),
                // child: CircularProgressIndicator(color: Colors.white),
              );
            }
          },
          future: SignInCubit.get(context).getEmail());
    });
  }
}
