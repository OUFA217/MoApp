import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:fitzapp/Components/Buttons/primary_button.dart';
import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Features/Exercises/getExercises.dart';
import 'package:fitzapp/Features/Language/language_cubit.dart';
import 'package:fitzapp/Presentation/Exercise/exercise.dart';
import 'package:fitzapp/Presentation/Home/home_screen.dart';
import 'package:fitzapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class ExercisesDay extends StatelessWidget {
  const ExercisesDay({
    super.key,
    required this.programName,
    required this.dayNumber,
  });
  final String programName;
  final String dayNumber;
  @override
  Widget build(BuildContext context) {
    final DatabaseReference database = FirebaseDatabase.instance.ref('program');

    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 15, 19, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 488.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      opacity: 1,
                      fit: BoxFit.cover,
                      image:
                          AssetImage(FitzConstants.exerceisesImageBackground),
                    ),
                  ),
                ),
                Positioned(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 24.w,
                        right: 24.w,
                        top: 64.h,
                      ),
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
                                  pushAndRemoved(context, const HomeScreen());
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
                    SizedBox(height: 160.h),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(S.of(context).bodyBuilding,
                              style: GoogleFonts.poppins(
                                  fontSize: 23.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)),
                          Text(S.of(context).workOutPlanBeginnerDescription,
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFA2A2A2),
                              )),
                          SizedBox(height: 9.h),
                          Row(
                            children: [
                              Text(
                                S.of(context).exercises,
                                style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                S.of(context).number10WithBracket,
                                style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFFA2A2A2)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 300.h,
                            child: FirebaseAnimatedList(
                              query: database
                                  .child(programName)
                                  .child(dayNumber)
                                  .orderByKey(),
                              itemBuilder:
                                  (context, snapshot, animation, index) {
                                Map exercise = snapshot.value as Map;
                                exercise['key'] = snapshot.key;
                                Logger().e(exercise);
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: 15.0.w),
                                          child: Container(
                                            height: 70.h,
                                            width: 70.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(13.r),
                                                image: const DecorationImage(
                                                    filterQuality:
                                                        FilterQuality.high,
                                                    image: AssetImage(
                                                      FitzConstants
                                                          .jumbJacksExercise,
                                                    ))),
                                          ),
                                        ),
                                        SizedBox(width: 18.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 150.w,
                                              padding: const EdgeInsets.only(
                                                      right: 13.0)
                                                  .r,
                                              child: Text(
                                                exercise['title'].toString(),
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14.5.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
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
                                        Padding(
                                          padding: EdgeInsets.only(top: 7.0.h),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            onTap: () {
                                              push(
                                                  context,
                                                  Exercise(
                                                    dayNumber: dayNumber,
                                                    programName: programName,
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
                                            child: CircleAvatar(
                                              maxRadius: 17,
                                              backgroundColor:
                                                  const Color.fromRGBO(
                                                      41, 45, 50, 1),
                                              child: CircleAvatar(
                                                  maxRadius: 15,
                                                  backgroundColor:
                                                      const Color.fromRGBO(
                                                          246, 168, 33, 1),
                                                  child: SvgPicture.asset(
                                                    FitzConstants.playArrowIcon,
                                                    width: 12.w,
                                                    height: 12.h,
                                                  )),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    // customDivider(
                                    //     width: 343.w,
                                    //     color: const Color.fromRGBO(
                                    //         46, 52, 63, 1)),
                                    SizedBox(height: 20.h),
                                  ],
                                );
                              },
                            ),
                          ),
                          // ListView.separated(
                          //     padding: EdgeInsets.only(top: 16.h),
                          //     physics: const NeverScrollableScrollPhysics(),
                          //     shrinkWrap: true,
                          //     itemBuilder: (context, index) {
                          //       return
                          //     },
                          //     separatorBuilder: (context, index) {
                          //       return Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           SizedBox(height: 16.h),
                          //           customDivider(
                          //             width: 343.w,
                          //             color: const Color(0xFF2E343F),
                          //           ),
                          //           SizedBox(height: 16.h),
                          //         ],
                          //       );
                          //     },
                          //     itemCount: 4),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.only(bottom: 30.h),
                            child: PrimaryButton(
                              title: S.of(context).startNow,
                              ontap: () {
                                TodayExercise todayExercise = TodayExercise();
                                todayExercise.getFirstExercise(context);
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
