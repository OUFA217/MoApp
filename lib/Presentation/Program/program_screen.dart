import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitzapp/Components/ButtomNavigationBar/buttomNavBar.dart';
import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Components/ProgramCard/programCard.dart';
import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Features/Authentication/SignIn/sign_in_cubit.dart';
import 'package:fitzapp/Features/Authentication/SignIn/sign_in_states.dart';
import 'package:fitzapp/Presentation/Activity/activity.dart';
import 'package:fitzapp/Presentation/Home/home_screen.dart';
import 'package:fitzapp/Presentation/Subscribtion/subscribtion.dart';
import 'package:fitzapp/Presentation/workOutScreens/IntermediatePlan/IntermediatePlan.dart';
import 'package:fitzapp/Presentation/workOutScreens/AdvancedPlan/AdvancedPlan.dart';
import 'package:fitzapp/Presentation/workOutScreens/ProPlan/ProPlan.dart';
import 'package:fitzapp/Presentation/Profile/profile.dart';
import 'package:fitzapp/Presentation/workOutScreens/beginnerPlan/beginnerPlan.dart';
import 'package:fitzapp/generated/l10n.dart';
import 'package:fitzapp/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:google_fonts/google_fonts.dart';

class Program extends StatefulWidget {
  const Program({super.key});

  @override
  State<Program> createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 1;

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
              body: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 61.h),
                    child: Column(
                      children: [
                        Text(
                          S.of(context).myProgram,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 23.sp,
                              color: Colors.white),
                        ),
                        SizedBox(height: 24.h),
                        ProgramCard(
                          title: 'Beginner Plan',
                          subTitle: S.of(context).freeWorkPlanSubTitle,
                          workImage: FitzConstants.freeWorkPlanImage,
                          ontap: () {
                            if (data['subscription'] == false) {
                              push(
                                  context,
                                  const BeginnerPlan(
                                    programName: "Beginner",
                                  ));
                            } else {
                              if (data['program_name'] == "Beginner") {
                                push(
                                    context,
                                    const BeginnerPlan(
                                      programName: "Beginner",
                                    ));
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Color.fromRGBO(13, 15, 19, 1),
                                      title: Text(
                                        S.of(context).Subscribtion,
                                        style: GoogleFonts.poppins(
                                            color: Colors.amber,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp),
                                      ),
                                      content: Text(
                                        S.of(context).wantSubscribtion,
                                        style: GoogleFonts.poppins(
                                            color: Colors.amber,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            pop(context);
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: GoogleFonts.poppins(
                                                color: Colors.amber,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            push(
                                                context,
                                                const Subscribtion(
                                                    programName: "Beginner"));
                                          },
                                          child: Text(
                                            'OK',
                                            style: GoogleFonts.poppins(
                                                color: Colors.amber,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }
                          },
                        ),
                        SizedBox(height: 14.h),
                        ProgramCard(
                          title: "Intermediate Plan",
                          subTitle: S.of(context).pro1WorkPlanSubTitle,
                          workImage: FitzConstants.pro1WorkPlanImage,
                          ontap: () {
                            if (data['subscription'] == false) {
                              push(
                                  context,
                                  IntermediatePlan(
                                    programName: "Intermediate",
                                  ));
                            } else {
                              if (data['program_name'] == "Intermediate") {
                                push(
                                    context,
                                    IntermediatePlan(
                                      programName: "Intermediate",
                                    ));
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Color.fromRGBO(13, 15, 19, 1),
                                      title: Text(
                                        S.of(context).Subscribtion,
                                        style: GoogleFonts.poppins(
                                            color: Colors.amber,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp),
                                      ),
                                      content: Text(
                                        S.of(context).wantSubscribtion,
                                        style: GoogleFonts.poppins(
                                            color: Colors.amber,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            pop(context);
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: GoogleFonts.poppins(
                                                color: Colors.amber,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            push(
                                                context,
                                                const Subscribtion(
                                                    programName:
                                                        "Intermediate"));
                                          },
                                          child: Text(
                                            'OK',
                                            style: GoogleFonts.poppins(
                                                color: Colors.amber,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }
                          },
                        ),
                        SizedBox(height: 14.h),
                        ProgramCard(
                          title: "Advanced Plan",
                          subTitle: S.of(context).pro2WorkPlanSubTitle,
                          workImage: FitzConstants.pro2WorkPlanImage,
                          ontap: () {
                            if (data['subscription'] == false) {
                              push(
                                  context,
                                  AdvancedPlan(
                                    programName: "Advanced",
                                  ));
                            } else {
                              if (data['program_name'] == "Advanced") {
                                push(
                                    context,
                                    AdvancedPlan(
                                      programName: "Advanced",
                                    ));
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Color.fromRGBO(13, 15, 19, 1),
                                      title: Text(
                                        S.of(context).Subscribtion,
                                        style: GoogleFonts.poppins(
                                            color: Colors.amber,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp),
                                      ),
                                      content: Text(
                                        S.of(context).wantSubscribtion,
                                        style: GoogleFonts.poppins(
                                            color: Colors.amber,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            pop(context);
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: GoogleFonts.poppins(
                                                color: Colors.amber,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            push(
                                                context,
                                                const Subscribtion(
                                                    programName: "Advanced"));
                                          },
                                          child: Text(
                                            'OK',
                                            style: GoogleFonts.poppins(
                                                color: Colors.amber,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }
                          },
                        ),
                        SizedBox(height: 14.h),
                        ProgramCard(
                          title: "Pro Workout Plan",
                          subTitle: S.of(context).pro3WorkPlanSubTitle,
                          workImage: FitzConstants.pro3WorkPlanImage,
                          ontap: () {
                            if (data['subscription'] == false) {
                              push(
                                  context,
                                  ProPlan(
                                    programName: "Pro",
                                  ));
                            } else {
                              if (data['program_name'] == "Pro") {
                                push(
                                    context,
                                    ProPlan(
                                      programName: "Pro",
                                    ));
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Color.fromRGBO(13, 15, 19, 1),
                                      title: Text(
                                        S.of(context).Subscribtion,
                                        style: GoogleFonts.poppins(
                                            color: Colors.amber,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp),
                                      ),
                                      content: Text(
                                        S.of(context).wantSubscribtion,
                                        style: GoogleFonts.poppins(
                                            color: Colors.amber,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            pop(context);
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: GoogleFonts.poppins(
                                                color: Colors.amber,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            push(
                                                context,
                                                const Subscribtion(
                                                    programName: "Pro"));
                                          },
                                          child: Text(
                                            'OK',
                                            style: GoogleFonts.poppins(
                                                color: Colors.amber,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }
                          },
                        ),
                      ],
                    ),
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
                        Navigator.popUntil(context, (route) => route.isCurrent);
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
                  }),
            );
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
                        push(
                          context,
                          const HomeScreen(),
                        );
                      } else if (value == 1) {
                        Navigator.popUntil(context, (route) => route.isCurrent);
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
                  }),
            );
          }
        },
        future: SignInCubit.get(context).getEmail(),
      );
    });
  }
}
