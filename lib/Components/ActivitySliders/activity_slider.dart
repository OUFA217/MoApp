import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Features/Language/language_cubit.dart';
import 'package:fitzapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ActivitySlider extends StatelessWidget {
  const ActivitySlider({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: false,
      addSemanticIndexes: false,
      itemCount: FitzConstants.nameOfActivities.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (161 / 233),
        mainAxisSpacing: 20.w,
        crossAxisSpacing: 19.h,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: FitzConstants.colorsOfContainerActivities[index],
            borderRadius: BorderRadius.all(
              Radius.circular(22.24.r),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SleekCircularSlider(
                min: 0,
                max: 100,
                initialValue: FitzConstants.fifty,
                innerWidget: (percentage) {
                  return Container();
                },
                appearance: CircularSliderAppearance(
                    angleRange: 360,
                    customColors: CustomSliderColors(
                        progressBarColor:
                            FitzConstants.colorsOfSliderActivities[index],
                        trackColor: Colors.grey,
                        dotColor: Colors.transparent),
                    size: 50,
                    customWidths: CustomSliderWidths(
                        progressBarWidth: 10, trackWidth: 10)),
              ),
              SizedBox(height: 8.h),
              Text(
                LanguageCubit.get(context).english
                    ? FitzConstants.nameOfActivities[index]
                    : FitzConstants.arabicNameOfActivities[index],
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                    color: Colors.white),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                S.of(context).sixHrHours,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: const Color(0xFFA2A2A2)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).fifty,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 40.sp,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.0.h),
                    child: Text(
                      S.of(context).precentatgeSign,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 30.sp,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
