// ignore_for_file: deprecated_member_use

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:fitzapp/Components/ActivitySliders/activity_slider.dart';
import 'package:fitzapp/Components/ButtomNavigationBar/buttomNavBar.dart';
import 'package:fitzapp/Components/Divider/custom_divider.dart';
import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Features/Authentication/SignIn/sign_in_cubit.dart';
import 'package:fitzapp/Features/Authentication/SignIn/sign_in_states.dart';
import 'package:fitzapp/Features/Language/language_cubit.dart';
import 'package:fitzapp/Presentation/Activity/activity.dart';
import 'package:fitzapp/Presentation/ExerciesesDay/exercises_day.dart';
import 'package:fitzapp/Presentation/Exercise/exercise.dart';
import 'package:fitzapp/Presentation/Profile/profile.dart';
import 'package:fitzapp/Presentation/Program/program_screen.dart';
import 'package:fitzapp/Presentation/workOutScreens/AdvancedPlan/AdvancedPlan.dart';
import 'package:fitzapp/Presentation/workOutScreens/IntermediatePlan/IntermediatePlan.dart';
import 'package:fitzapp/Presentation/workOutScreens/ProPlan/ProPlan.dart';
import 'package:fitzapp/Presentation/workOutScreens/beginnerPlan/beginnerPlan.dart';
import 'package:fitzapp/generated/l10n.dart';
import 'package:fitzapp/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final DatabaseReference database =
        FirebaseDatabase.instance.ref().child('users');
    final DateTime today = DateTime.now();
    final DateFormat dateFormat = DateFormat('d-MM-yyyy', "en");
    final String firstDay = dateFormat.format(today);

    int currentIndex = 0;
    return BlocBuilder<SignInCubit, InitialSignInState>(
        builder: (context, state) {
      return FutureBuilder<DocumentSnapshot>(
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.data!.exists.toString());
          }
          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text(SignInCubit.get(context).email.toString());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            return Scaffold(
                backgroundColor: Color.fromRGBO(13, 15, 19, 1),
                body: Padding(
                  padding: LanguageCubit.get(context).english == true
                      ? EdgeInsets.only(top: 60.h, left: 16.w)
                      : EdgeInsets.only(top: 60.h, right: 16.w),
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).goodMorning,
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color: Colors.white),
                              ),
                              Text(
                                data['firstName'].toString(),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23.sp,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 27.h),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {},
                        child: Container(
                          width: 343.w,
                          height: 133,
                          // height: 139,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF6A821),
                            borderRadius: BorderRadius.all(
                              const Radius.circular(30).r,
                            ),
                          ),
                          child: Padding(
                            padding: LanguageCubit.get(context).english == true
                                ? EdgeInsets.only(
                                    left: 30.w, right: 48.w, top: 15.5.h)
                                : EdgeInsets.only(
                                    left: 48.w, right: 30.w, top: 15.5.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 143),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        S.of(context).myPlanForToday,
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 28),
                                      ),
                                      Text(
                                        S.of(context).oneSevenComplete,
                                        style: GoogleFonts.inter(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp),
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                SleekCircularSlider(
                                  innerWidget: (percentage) {
                                    return Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            percentage.toInt().toString(),
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 32.sp),
                                          ),
                                          Text(
                                            S.of(context).precentatgeSign,
                                            style: GoogleFonts.inter(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  appearance: CircularSliderAppearance(
                                      customColors: CustomSliderColors(
                                        trackColor: const Color(0xFFFCE4BA),
                                      ),
                                      angleRange: 360,
                                      size: 100,
                                      customWidths: CustomSliderWidths(
                                          progressBarWidth: 0,
                                          trackWidth: 10.w)),
                                  min: 0,
                                  max: 100,
                                  initialValue: 0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 39.h),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          push(context, const Program(),
                              curves: Curves.easeOut,
                              duration: const Duration(milliseconds: 300),
                              isSlideTransition: true);
                        },
                        child: InkWell(
                          onTap: () {
                            if (data['subscription'] == false) {
                              push(context, const Program());
                            } else {
                              if (data['program_name'] == "Beginner") {
                                push(
                                    context,
                                    const BeginnerPlan(
                                        programName: "Beginner"));
                              } else if (data['program_name'] ==
                                  "Intermediate") {
                                push(
                                    context,
                                    const IntermediatePlan(
                                        programName: "Intermediate"));
                              } else if (data['program_name'] == "Advanced") {
                                push(
                                    context,
                                    const AdvancedPlan(
                                        programName: "Advanced"));
                              } else {
                                push(
                                    context, const ProPlan(programName: "Pro"));
                              }
                            }
                          },
                          child: Container(
                            height: 280.h,
                            width: 343.w,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  // colorFilter: Color,
                                  fit: BoxFit.none,
                                  image: AssetImage(
                                    FitzConstants.startTrainingContainer,
                                  )),
                              borderRadius: BorderRadius.all(
                                const Radius.circular(30).r,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 74.0.h),
                              child: Column(
                                children: [
                                  Text(
                                    FitzConstants.startYour.toUpperCase(),
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w300,
                                        height: 1.1,
                                        fontSize: 24,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    FitzConstants.training.toUpperCase(),
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        height: 1.1,
                                        fontSize: 40,
                                        color: const Color.fromRGBO(
                                            246, 168, 33, 1)),
                                  ),
                                  Text(
                                    FitzConstants.today.toUpperCase(),
                                    style: GoogleFonts.poppins(
                                        height: 1.1,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 40,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    width: 99.w,
                                    height: 36.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(1).r),
                                    child: Center(
                                      child: Text(
                                        FitzConstants.startNow.toUpperCase(),
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 44.h),
                      if (data['subscription'] == false)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).startNewActivity,
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp),
                            ),
                            Padding(
                              padding: LanguageCubit.get(context).english
                                  ? EdgeInsets.only(right: 12.w, bottom: 10.h)
                                  : EdgeInsets.only(left: 12.w, bottom: 10.h),
                              child: const ActivitySlider(),
                            )
                          ],
                        )
                      else
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  S.of(context).dailyTask,
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp),
                                ),
                                const Spacer(),
                                Padding(
                                  padding:
                                      LanguageCubit.get(context).english == true
                                          ? EdgeInsets.only(right: 16.0.w)
                                          : EdgeInsets.only(left: 16.0.w),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    onTap: () {
                                      FirebaseDatabase.instance
                                          .reference()
                                          .child('users')
                                          .child(data['phoneNumber'])
                                          .child(firstDay)
                                          .child('day')
                                          .onValue
                                          .listen((DatabaseEvent snapshot) {
                                        var event = snapshot.snapshot.value;
                                        push(
                                            context,
                                            ExercisesDay(
                                              programName: data['program_name'],
                                              dayNumber: "Day $event",
                                            ));
                                      });

                                      // Handle the real-time data changes here
                                    },
                                    child: Text(
                                      S.of(context).seeAll,
                                      style: GoogleFonts.inter(
                                          color: const Color(0xFFF2B200),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(height: 5.h),
                            FirebaseAnimatedList(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              query: database
                                  .child(data['phoneNumber'])
                                  .child(firstDay)
                                  .child('workouts')
                                  .orderByKey(),
                              itemBuilder: (context, snapshot,
                                  Animation<double> animation, index) {
                                Map exercise = snapshot.value as Map;
                                exercise['key'] = snapshot.key;
                                return Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 50.h,
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 10.h),
                                            child: SvgPicture.asset(
                                              "assets/Icons/dumbel3.svg",
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 16.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 150.w,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 10.0.h),
                                                child: Text(
                                                  exercise['title'],
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.inter(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 16.sp),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 8.h),
                                            exercise['duration'] == 0
                                                ? Text(
                                                    exercise['reps'].toString(),
                                                    style: GoogleFonts.inter(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color
                                                            .fromRGBO(
                                                            246, 168, 33, 1)),
                                                  )
                                                : Text(
                                                    "${exercise['duration'].toString()} : 00",
                                                    style: GoogleFonts.inter(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color
                                                            .fromRGBO(
                                                            246, 168, 33, 1)),
                                                  )
                                          ],
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          onTap: () {
                                            push(
                                                context,
                                                Exercise(
                                                  id: exercise['key'],
                                                  duration:
                                                      exercise['duration'],
                                                  link: exercise['link'],
                                                  muscle: exercise['muscle'],
                                                  title: exercise['title'],
                                                  reps: exercise['reps'],
                                                  sets: exercise['sets'],
                                                ));
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                right: 16.47.w, top: 20.h),
                                            child: CircleAvatar(
                                              maxRadius: 18,
                                              backgroundColor:
                                                  const Color.fromRGBO(
                                                      41, 45, 50, 1),
                                              child: CircleAvatar(
                                                  maxRadius: 15,
                                                  backgroundColor:
                                                      const Color.fromRGBO(
                                                          19, 13, 2, 1),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 2.0.w),
                                                    child: SvgPicture.asset(
                                                      FitzConstants
                                                          .playDailyTaskIcon,
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    customDivider(
                                        width: 343.w,
                                        color: const Color.fromRGBO(
                                            46, 52, 63, 1)),
                                    SizedBox(height: 20.h),
                                  ],
                                );
                              },
                            ),
                          ],
                        )
                    ],
                  )),
                ),
                bottomNavigationBar: ButtomNavigationBar(
                  snakeShape: SnakeShape.indicator,
                  currentIndex: currentIndex,
                  onTap: (value) {
                    setState(() {
                      currentIndex = value;
                      if (value == 0) {
                        Navigator.popUntil(context, (route) => route.isCurrent);
                      } else if (value == 1) {
                        if (data['subscription'] == false) {
                          push(context, const Program());
                        } else {
                          if (data['program_name'] == "Beginner") {
                            push(context,
                                const BeginnerPlan(programName: "Beginner"));
                          } else if (data['program_name'] == "Intermediate") {
                            push(
                                context,
                                const IntermediatePlan(
                                    programName: "Intermediate"));
                          } else if (data['program_name'] == "Advanced") {
                            push(context,
                                const AdvancedPlan(programName: "Advanced"));
                          } else {
                            push(context, const ProPlan(programName: "Pro"));
                          }
                        }
                      } else if (value == 2) {
                        push(
                          context,
                          const Activity(),
                        );
                      } else {
                        push(
                          context,
                          const Profile(),
                        );
                      }
                    });
                  },
                ));
          } else {
            return Scaffold(
                body: Loading(),
                // body: const Center(
                //   child: CircularProgressIndicator(),
                // ),
                backgroundColor: Color.fromRGBO(13, 15, 19, 1),
                bottomNavigationBar: ButtomNavigationBar(
                  snakeShape: SnakeShape.indicator,
                  currentIndex: currentIndex,
                  onTap: (value) {
                    setState(() {
                      currentIndex = value;
                      if (value == 0) {
                        Navigator.popUntil(context, (route) => route.isCurrent);
                      } else if (value == 1) {
                        push(context, const Program());
                      } else {
                        push(
                          context,
                          const Profile(),
                        );
                      }
                    });
                  },
                ));
          }
        },
        future: SignInCubit.get(context).getEmail(),
      );
    });
  }
}
