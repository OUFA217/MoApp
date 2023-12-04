import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitzapp/Components/ButtomNavigationBar/buttomNavBar.dart';
import 'package:fitzapp/Components/Divider/custom_divider.dart';
import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Features/Authentication/SignIn/sign_in_cubit.dart';
import 'package:fitzapp/Features/Authentication/SignIn/sign_in_states.dart';
import 'package:fitzapp/Features/Language/language_cubit.dart';
import 'package:fitzapp/Presentation/Activity/activity.dart';
import 'package:fitzapp/Presentation/EditProfile/edit_profile.dart';
import 'package:fitzapp/Presentation/Home/home_screen.dart';
import 'package:fitzapp/Presentation/Privacy/privacy_screen.dart';
import 'package:fitzapp/Presentation/Program/program_screen.dart';
import 'package:fitzapp/Presentation/Settings/settings_screen.dart';
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
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 3;
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
            return Scaffold(
              backgroundColor: Color.fromRGBO(13, 15, 19, 1),
              body: Padding(
                padding: LanguageCubit.get(context).english
                    ? EdgeInsets.only(top: 64.h, left: 24.0.w)
                    : EdgeInsets.only(top: 64.h, right: 24.0.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color.fromRGBO(40, 42, 46, 1),
                        child: BackButton(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                                radius: 50.r,
                                backgroundColor:
                                    const Color.fromRGBO(40, 42, 46, 1),
                                child: SvgPicture.asset(
                                  FitzConstants.profilePicture,
                                )),
                            SizedBox(width: 48.w),
                            customDivider(width: 103.5.h, rotatedDivider: true),
                            data['subscription'] == true
                                ? Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.of(context).endOn,
                                          style: GoogleFonts.inter(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromARGB(
                                                  255, 114, 114, 114)),
                                        ),
                                        Text(
                                          data['end_on'].toString(),
                                          style: GoogleFonts.inter(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox()
                          ]),
                      SizedBox(height: 21.h),
                      Text(
                        "${data['firstName'].toUpperCase()}\n${data['lastName'].toUpperCase()}",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 19.h),
                      customDivider(
                          width: 325.w,
                          color: const Color.fromRGBO(44, 44, 46, 1)),
                      SizedBox(height: 17.5.h),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          String fullName =
                              data['firstName'] + " " + data['lastName'];
                          push(
                              context,
                              EditProfile(
                                fullName: fullName,
                                email: data['email'],
                              ));
                        },
                        child: Row(
                          children: [
                            Text(
                              S.of(context).editProfile,
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 14.5.h),
                      customDivider(
                          width: 325.w,
                          color: const Color.fromRGBO(44, 44, 46, 1)),
                      SizedBox(height: 17.h),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          push(context, const Privacy());
                        },
                        child: Row(
                          children: [
                            Text(
                              S.of(context).privacyPolicy,
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5.5.h),
                      customDivider(
                          width: 325.w,
                          color: const Color.fromRGBO(44, 44, 46, 1)),
                      SizedBox(height: 13.h),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          push(context, const SettingsScreen());
                        },
                        child: Row(
                          children: [
                            Text(
                              S.of(context).settings,
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 13.h),
                      customDivider(
                          width: 325.w,
                          color: const Color.fromRGBO(44, 44, 46, 1)),
                      SizedBox(height: 13.h),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          SignInCubit.get(context).signOut(context);
                        },
                        child: Row(
                          children: [
                            Text(
                              S.of(context).signOut,
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 13.h),
                      customDivider(
                          width: 325.w,
                          color: const Color.fromRGBO(44, 44, 46, 1)),
                      SizedBox(height: 14.5.h),
                      data['subscription'] == true
                          ? InkWell(
                              onTap: () {
                                push(context, const Program(),
                                    curves: Curves.easeOut,
                                    duration: const Duration(milliseconds: 800),
                                    isSlideTransition: true);
                              },
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 10.0.h),
                                child: Container(
                                  height: LanguageCubit.get(context).english
                                      ? 83.h
                                      : 93.h,
                                  width: 327.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      color:
                                          const Color.fromRGBO(40, 42, 46, 1)),
                                  child: Padding(
                                    padding: EdgeInsets.all(12.r),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 18.h,
                                          width: 37.13,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.66.r),
                                              color: Colors.red),
                                          child: Center(
                                            child: Text(
                                              S.of(context).pro,
                                              style: GoogleFonts.inter(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              S.of(context).upgradeToPremium,
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12.sp,
                                                  color: const Color.fromRGBO(
                                                      255, 255, 255, 1)),
                                            ),
                                            const Spacer(),
                                            const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                        Expanded(
                                          child: Text(
                                            S.of(context).descriptionForPremium,
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12.sp,
                                                color: const Color.fromRGBO(
                                                    255, 255, 255, 1)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
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
                      } else if (value == 2) {
                        push(
                          context,
                          const Activity(),
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
                        push(context, const Program());
                      } else if (value == 2) {
                        push(
                          context,
                          const Activity(),
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
