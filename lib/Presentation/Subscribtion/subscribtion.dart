// ignore_for_file: use_build_context_synchronously

import 'package:fitzapp/Components/Buttons/primary_button.dart';
import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Features/Exercises/uploadAdvancedPlan.dart';
import 'package:fitzapp/Features/Exercises/uploadBeginnerPlan.dart';
import 'package:fitzapp/Features/Exercises/uploadIntermediatePlan.dart';
import 'package:fitzapp/Features/Exercises/uploadProPlan.dart';
import 'package:fitzapp/Features/Stripe/stripe.dart';
import 'package:fitzapp/Presentation/Home/home_screen.dart';
import 'package:fitzapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Subscribtion extends StatefulWidget {
  const Subscribtion({super.key, required this.programName});

  final String programName;
  @override
  State<Subscribtion> createState() => _SubscribtionState();
}

class _SubscribtionState extends State<Subscribtion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 15, 19, 1),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 581.h,
              width: 377.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(
                    FitzConstants.workOutPlanBeginnerSubscribtionImage,
                  ),
                ),
              ),
              child: Container(
                height: 581.h,
                width: 377.w,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter),
                ),
              ),
            ),
            Positioned(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.w, top: 50.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Color.fromRGBO(13, 15, 19, 1),
                              child: Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_back_ios,
                                      size: 25, color: Colors.white),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 105.0.w),
                              child: Text(
                                S.of(context).plans,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 190.h),
                        Text(
                          S.of(context).workOutPlan,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          widget.programName.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.w700),
                        ),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 5.h,
                                    width: 5.w,
                                    margin: const EdgeInsets.only(left: 8),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: Colors.white),
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    FitzConstants
                                            .workOutPlanBeginnerSubscribtionDescription[
                                        index],
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.sp,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1)),
                                  )
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 3.h);
                            },
                            itemCount: FitzConstants
                                .workOutPlanBeginnerSubscribtionDescription
                                .length),
                        SizedBox(height: 51.h),
                        Container(
                          width: 314.w,
                          height: 80.h,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.r)),
                              color: const Color.fromRGBO(246, 168, 33, 0.2),
                              border:
                                  Border.all(color: const Color(0xFFF6A821))),
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.0.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFFFFFFFF),
                                          shape: BoxShape.circle),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.5),
                                      child: Container(
                                        height: 9,
                                        width: 9,
                                        decoration: const BoxDecoration(
                                            color: Color(0xFFF6A821),
                                            shape: BoxShape.circle),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: 14.w),
                                Padding(
                                  padding: const EdgeInsets.only(top: 22.0).h,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        S.of(context).monthly,
                                        style: GoogleFonts.poppins(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                          right: 30.0, bottom: 16)
                                      .r,
                                  child: Text(
                                    S.of(context).monthlyPriceSubscription,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.sp,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 41.h),
                        PrimaryButton(
                          width: 314.w,
                          title: S.of(context).subscribeNow,
                          ontap: () {
                            setState(() async {
                              try {
                                PaymentManager.makePayment()
                                    .then((value) async {
                                  SharedPreferences sharedPreferences =
                                      await SharedPreferences.getInstance();
                                  String formattedEndOnDate =
                                      DateFormat('yyyy-MM-dd - kk:mm', "en")
                                          .format(DateTime.now()
                                              .add(const Duration(days: 30)));

                                  String formattedNowDate =
                                      DateFormat('yyyy-MM-dd – kk:mm', "en")
                                          .format(DateTime.now());
                                  if (widget.programName == "Beginner") {
                                    await uploadBeginnerData();
                                    FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(sharedPreferences
                                            .getString("email"))
                                        .update({
                                      "end_on": formattedEndOnDate,
                                      "subscription": true,
                                      "start_on": formattedNowDate,
                                      "week_1": false,
                                      "week_2": false,
                                      "week_3": false,
                                      "week_4": false,
                                      "program_name": "Beginner",
                                    });
                                    pushAndRemoved(context, const HomeScreen());
                                  } else if (widget.programName ==
                                      "Intermediate") {
                                    await uploadIntermediateData();

                                    FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(sharedPreferences
                                            .getString("email"))
                                        .update({
                                      "end_on": formattedEndOnDate,
                                      "subscription": true,
                                      "start_on": formattedNowDate,
                                      "week_1": false,
                                      "week_2": false,
                                      "week_3": false,
                                      "week_4": false,
                                      "program_name": "Intermediate",
                                    });
                                    pushAndRemoved(context, const HomeScreen());
                                  } else if (widget.programName == "Advanced") {
                                    await uploadAdvancedData();
                                    FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(sharedPreferences
                                            .getString("email"))
                                        .update({
                                      "end_on": formattedEndOnDate,
                                      "subscription": true,
                                      "start_on": formattedNowDate,
                                      "week_1": false,
                                      "week_2": false,
                                      "week_3": false,
                                      "week_4": false,
                                      "program_name": "Advanced",
                                    });
                                    pushAndRemoved(context, const HomeScreen());
                                  } else if (widget.programName == "Pro") {
                                    await uploadProData();

                                    FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(sharedPreferences
                                            .getString("email"))
                                        .update({
                                      "end_on": formattedEndOnDate,
                                      "subscription": true,
                                      "start_on": formattedNowDate,
                                      "week_1": false,
                                      "week_2": false,
                                      "week_3": false,
                                      "week_4": false,
                                      "program_name": "Pro",
                                    });
                                    pushAndRemoved(context, const HomeScreen());
                                  } else {}
                                });
                              } catch (error) {
                                Logger().e(error);
                              }
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
