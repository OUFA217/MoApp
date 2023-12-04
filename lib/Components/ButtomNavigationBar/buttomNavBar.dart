// ignore_for_file: deprecated_member_use, must_be_immutable, file_names
import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Features/Language/language_cubit.dart';
import 'package:fitzapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class ButtomNavigationBar extends StatefulWidget {
  ButtomNavigationBar(
      {super.key,
      required this.currentIndex,
      this.onTap,
      required this.snakeShape});
  int? currentIndex;
  void Function(int)? onTap;
  SnakeShape? snakeShape;
  @override
  State<ButtomNavigationBar> createState() => _ButtomNavigationBarState();
}

class _ButtomNavigationBarState extends State<ButtomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SnakeNavigationBar.color(
          elevation: 0.0,
          onTap: widget.onTap!,
          showSelectedLabels: true,
          snakeShape: SnakeShape.indicator,
          behaviour: SnakeBarBehaviour.values[0],
          unselectedLabelStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: const Color.fromRGBO(162, 162, 162, 1)),
          selectedLabelStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
          ),
          showUnselectedLabels: true,
          currentIndex: widget.currentIndex!,
          snakeViewColor: const Color.fromRGBO(25, 29, 36, 1),
          backgroundColor: const Color.fromRGBO(25, 29, 36, 1),
          selectedItemColor: const Color.fromRGBO(246, 168, 33, 1),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 3.h),
                  child: SvgPicture.asset(
                    FitzConstants.homeIcon,
                  ),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 3.h),
                  child: SvgPicture.asset(
                    FitzConstants.homeIcon,
                    color: const Color.fromRGBO(246, 168, 33, 1),
                  ),
                ),
                label: S.of(context).home),
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 3.h),
                  child: SvgPicture.asset(
                    FitzConstants.programIcon,
                    color: const Color.fromRGBO(246, 168, 33, 1),
                  ),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 3.h),
                  child: SvgPicture.asset(
                    FitzConstants.programIcon,
                  ),
                ),
                label: S.of(context).program),
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 3.h),
                  child: SvgPicture.asset(
                    FitzConstants.activityIcon,
                    color: const Color.fromRGBO(246, 168, 33, 1),
                  ),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 3.h),
                  child: SvgPicture.asset(
                    FitzConstants.activityIcon,
                  ),
                ),
                label: S.of(context).activity),
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 3.h),
                  child: SvgPicture.asset(
                    FitzConstants.profileIcon,
                    color: const Color.fromRGBO(246, 168, 33, 1),
                  ),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 3.h),
                  child: SvgPicture.asset(
                    FitzConstants.profileIcon,
                    theme: const SvgTheme(xHeight: 20),
                  ),
                ),
                label: S.of(context).setting),
          ],
        ),
        Padding(
          padding: LanguageCubit.get(context).english
              ? widget.currentIndex == 0
                  ? const EdgeInsets.only(left: 23).w
                  : widget.currentIndex == 1
                      ? const EdgeInsets.only(left: 116).w
                      : widget.currentIndex == 2
                          ? const EdgeInsets.only(left: 211).w
                          : const EdgeInsets.only(left: 307).w
              : widget.currentIndex == 0
                  ? const EdgeInsets.only(right: 23).w
                  : widget.currentIndex == 1
                      ? const EdgeInsets.only(right: 116).w
                      : widget.currentIndex == 2
                          ? const EdgeInsets.only(right: 211).w
                          : const EdgeInsets.only(right: 307).w,
          child: Container(
            color: const Color.fromRGBO(242, 178, 0, 1),
            width: 46.w,
            height: 2.h,
          ),
        )
      ],
    );
  }
}
