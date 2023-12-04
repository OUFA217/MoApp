import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:fitzapp/Components/ActivitySliders/activity_slider.dart';
import 'package:fitzapp/Components/ButtomNavigationBar/buttomNavBar.dart';
import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Features/Authentication/SignIn/sign_in_cubit.dart';
import 'package:fitzapp/Presentation/Home/home_screen.dart';
import 'package:fitzapp/Presentation/Profile/profile.dart';
import 'package:fitzapp/Presentation/Program/program_screen.dart';
import 'package:fitzapp/Presentation/workOutScreens/AdvancedPlan/AdvancedPlan.dart';
import 'package:fitzapp/Presentation/workOutScreens/IntermediatePlan/IntermediatePlan.dart';
import 'package:fitzapp/Presentation/workOutScreens/ProPlan/ProPlan.dart';
import 'package:fitzapp/Presentation/workOutScreens/beginnerPlan/beginnerPlan.dart';
import 'package:fitzapp/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:google_fonts/google_fonts.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 2;
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

          return Scaffold(
              backgroundColor: const Color.fromRGBO(13, 15, 19, 1),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 17.0, left: 16).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      EasyDateTimeLine(
                        initialDate: DateTime.now(),
                        timeLineProps: EasyTimeLineProps(
                          backgroundColor: const Color.fromRGBO(13, 15, 19, 1),
                          hPadding: 24.0.h,
                          separatorPadding: 14.0.w,
                        ),
                        onDateChange: (selectedDate) {},
                        dayProps: EasyDayProps(
                          todayStyle: DayStyle(
                            dayStrStyle: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600),
                            dayNumStyle: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600),
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(58, 58, 60, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32))),
                          ),
                          activeDayStyle: DayStyle(
                            dayStrStyle: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600),
                            dayNumStyle: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600),
                            decoration: const BoxDecoration(
                                color: Color(0xFFF6A821),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32))),
                          ),
                          height: 64.h,
                          width: 40.w,
                          inactiveDayStyle: DayStyle(
                            dayStrStyle: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600),
                            dayNumStyle: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600),
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(58, 58, 60, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32))),
                          ),
                          dayStructure: DayStructure.dayStrDayNum,
                        ),
                        headerProps: EasyHeaderProps(
                          centerHeader: true,
                          selectedDateFormat:
                              SelectedDateFormat.fullDateDMonthAsStrY,
                          padding:
                              EdgeInsets.only(top: 60.h, left: 24, right: 24),
                          selectedDateStyle: GoogleFonts.openSans(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17.sp),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0.h),
                        child: const ActivitySlider(),
                      )
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: ButtomNavigationBar(
                snakeShape: SnakeShape.indicator,
                currentIndex: currentIndex,
                onTap: (value) {
                  setState(() {
                    currentIndex = value;
                    if (value == 0) {
                      push(
                        context,
                        const HomeScreen(),
                      );
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
                    } else if (value == 3) {
                      push(
                        context,
                        const Profile(),
                      );
                    } else {
                      Navigator.popUntil(context, (route) => route.isCurrent);
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
              backgroundColor: const Color.fromRGBO(13, 15, 19, 1),
              bottomNavigationBar: ButtomNavigationBar(
                snakeShape: SnakeShape.indicator,
                currentIndex: currentIndex,
                onTap: (value) {
                  setState(() {
                    currentIndex = value;
                    if (value == 0) {
                      push(
                        context,
                        const HomeScreen(),
                      );
                    } else if (value == 1) {
                      push(context, const Program());
                    } else if (value == 3) {
                      push(
                        context,
                        const Profile(),
                      );
                    } else {
                      Navigator.popUntil(context, (route) => route.isCurrent);
                    }
                  });
                },
              ));
        }
      },
      future: SignInCubit.get(context).getEmail(),
    );
  }
}
