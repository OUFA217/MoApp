import 'package:fitzapp/Components/Divider/custom_divider.dart';
import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Features/Exercises/getExercises.dart';
import 'package:fitzapp/Features/Language/language_cubit.dart';
import 'package:fitzapp/Presentation/ExerciesesDay/exercises_day.dart';
import 'package:fitzapp/Presentation/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Exercise extends StatefulWidget {
  const Exercise(
      {super.key,
      required this.duration,
      required this.link,
      required this.muscle,
      required this.reps,
      required this.title,
      required this.sets,
      required this.id,
      this.dayNumber,
      this.programName});
  final String title;
  final String reps;
  final String muscle;
  final String link;
  final String sets;
  final int duration;
  final String id;
  final String? programName;
  final String? dayNumber;

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  late YoutubePlayerController controller;
  @override
  void initState() {
    super.initState();
    String? videoId;

    videoId = YoutubePlayer.convertUrlToId(widget.link);
    controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
          showLiveFullscreenButton: false,
          useHybridComposition: false,
          autoPlay: true,
          forceHD: true,
          hideThumbnail: true,
          hideControls: true),
    );
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  bool isPlayed = true;
  bool isEnded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(13, 15, 19, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: LanguageCubit.get(context).english
                ? const EdgeInsets.only(left: 25, top: 61).r
                : const EdgeInsets.only(right: 25, top: 61).r,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios,
                      size: 25, color: Colors.white),
                  onPressed: () {
                    if (widget.dayNumber == null) {
                      pushAndRemoved(context, const HomeScreen());
                    } else {
                      pushAndRemoved(
                          context,
                          ExercisesDay(
                              programName: widget.programName!,
                              dayNumber: widget.dayNumber!));
                    }
                  },
                ),
                SizedBox(width: 65.w),
                Text(
                  "Exercises ${widget.id}",
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                SizedBox(
                    height: 440.h,
                    width: double.infinity,
                    child: isEnded == false
                        ? YoutubePlayer(
                            controlsTimeOut: const Duration(seconds: 0),
                            controller: controller,
                            showVideoProgressIndicator: false,
                            onEnded: (metaData) {
                              setState(() {
                                isEnded = true;
                                Logger().e(metaData);
                              });
                            },
                          )
                        : const SizedBox()),
                Padding(
                  padding: EdgeInsets.only(top: 10.0.h),
                  child: Container(
                    color: Colors.black,
                    height: 50.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 314.h),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32.r),
                            topRight: Radius.circular(32.r))),
                    child: Padding(
                      padding: LanguageCubit.get(context).english
                          ? EdgeInsets.only(top: 85.5.h)
                          : EdgeInsets.only(top: 71.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              widget.title,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 23.sp,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Center(
                            child: Container(
                              width: 343.w,
                              height: 71.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: const Color(0XFF282A2E)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 28.5.w,
                                      top: 12.h,
                                      bottom: 12.h,
                                    ).r,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Sets',
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.sp,
                                                color: const Color.fromRGBO(
                                                    162, 162, 162, 1)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          widget.sets.toString(),
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.sp,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  customDivider(
                                      width: 47.w,
                                      color:
                                          const Color.fromRGBO(46, 52, 63, 1),
                                      rotatedDivider: true),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 12.h,
                                      bottom: 12.h,
                                    ).r,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'reps',
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.sp,
                                                color: const Color.fromRGBO(
                                                    162, 162, 162, 1)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          widget.reps.toString(),
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.sp,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  customDivider(
                                      width: 47.w,
                                      color:
                                          const Color.fromRGBO(46, 52, 63, 1),
                                      rotatedDivider: true),
                                  widget.duration == 0
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                                  left: 16.w,
                                                  top: 12.h,
                                                  bottom: 12.h,
                                                  right: 28.5.w)
                                              .r,
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Muscle',
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16.sp,
                                                      color:
                                                          const Color.fromRGBO(
                                                              162,
                                                              162,
                                                              162,
                                                              1)),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text(
                                                widget.muscle.toString(),
                                                textScaleFactor: 1,
                                                style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16.sp,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Padding(
                                          padding: EdgeInsets.only(
                                                  left: 16.w,
                                                  top: 12.h,
                                                  bottom: 12.h,
                                                  right: 28.5.w)
                                              .r,
                                          child: Column(
                                            children: [
                                              Text(
                                                'Duration',
                                                style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.sp,
                                                    color: const Color.fromRGBO(
                                                        162, 162, 162, 1)),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text(
                                                "${widget.duration} mins",
                                                style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16.sp,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 88.h),
                          Padding(
                            padding: LanguageCubit.get(context).english
                                ? EdgeInsets.only(left: 16.0.w)
                                : EdgeInsets.only(right: 16.0.w),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    TodayExercise todayExercise =
                                        TodayExercise();
                                    todayExercise.getPreviousExercise(context,
                                        id: widget.id);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(15.0).r,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(40, 42, 46, 1)),
                                    child: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: LanguageCubit.get(context).english
                                      ? EdgeInsets.only(right: 26.w)
                                      : EdgeInsets.only(left: 26.w),
                                  child: InkWell(
                                    onTap: () {
                                      TodayExercise todayExercise =
                                          TodayExercise();
                                      todayExercise.getNextExercise(context,
                                          id: widget.id);
                                    },
                                    child: Container(
                                      width: 96.w,
                                      height: 48.h,
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              246, 168, 33, 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.r))),
                                      child: Center(
                                          child: Text(
                                        FitzConstants.next,
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.sp),
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 60.0).h,
                  child: Center(
                    child: Container(
                        width: 96.w,
                        height: 96.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amber,
                            border:
                                Border.all(color: Colors.black, width: 1.5)),
                        child: InkWell(
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                if (isPlayed == true && isEnded == false) {
                                  isPlayed = false;
                                  controller.pause();
                                } else if (isPlayed == false &&
                                    isEnded == false) {
                                  isPlayed = true;
                                  controller.play();
                                } else {
                                  isEnded = false;
                                  controller.seekTo(Duration.zero);
                                  controller.play();
                                }
                              });
                            },
                            child: isPlayed == false
                                ? SvgPicture.asset(
                                    FitzConstants.playArrowIcon,
                                    fit: BoxFit.scaleDown,
                                  )
                                : isEnded == true
                                    ? const Icon(
                                        Icons.replay,
                                        color: Colors.white,
                                        size: 40,
                                      )
                                    : const Icon(
                                        Icons.pause,
                                        color: Colors.white,
                                        size: 40,
                                      ))),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
