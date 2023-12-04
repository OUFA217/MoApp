import 'package:fitzapp/Components/Divider/custom_divider.dart';
import 'package:fitzapp/Components/SearchField/customize_search_field.dart';
import 'package:fitzapp/Features/Language/language_cubit.dart';
import 'package:fitzapp/Features/Language/language_states.dart';
import 'package:fitzapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, InitialLanguageStates>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: Color.fromRGBO(13, 15, 19, 1),
        body: Padding(
          padding: LanguageCubit.get(context).english
              ? EdgeInsets.only(top: 64.h, left: 24.0.w)
              : EdgeInsets.only(top: 64.h, right: 24.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Color.fromRGBO(40, 42, 46, 1),
                    child: BackButton(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                      width: LanguageCubit.get(context).english ? 73.w : 120.w),
                  Text(
                    S.of(context).language,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 23.sp,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 34.h),
              Padding(
                  padding: LanguageCubit.get(context).english == true
                      ? EdgeInsets.only(left: 8.0.w)
                      : EdgeInsets.only(right: 8.0.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomizeSearch(),
                        SizedBox(height: 24.h),
                        customDivider(
                            width: 311.w, color: const Color(0xFF2C2C2E)),
                        SizedBox(height: 18.h),
                        InkWell(
                          onTap: () {
                            LanguageCubit.get(context).isEnglish();
                          },
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Row(
                            children: [
                              Text(
                                S.of(context).english,
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp,
                                    color: const Color(0xFFFFFFFF)),
                              ),
                              const Spacer(),
                              LanguageCubit.get(context).english == true
                                  ? Padding(
                                      padding: EdgeInsets.only(right: 32.w),
                                      child: Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.r)),
                                        ),
                                        checkColor: const Color(0xFFF6A821),
                                        fillColor:
                                            const MaterialStatePropertyAll(
                                                Colors.white),
                                        value:
                                            LanguageCubit.get(context).english,
                                        onChanged: (value) {
                                          LanguageCubit.get(context)
                                              .setEnglishFalse();
                                        },
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        customDivider(
                            width: 311.w, color: const Color(0xFF2C2C2E)),
                        SizedBox(height: 16.h),
                        InkWell(
                          onTap: () {
                            LanguageCubit.get(context).isEnglish();
                          },
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Row(
                            children: [
                              Text(
                                S.of(context).arabic,
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp,
                                    color: const Color(0xFFFFFFFF)),
                              ),
                              const Spacer(),
                              LanguageCubit.get(context).english == false
                                  ? Padding(
                                      padding: EdgeInsets.only(right: 32.w),
                                      child: Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.r)),
                                        ),
                                        checkColor: const Color(0xFFF6A821),
                                        fillColor:
                                            const MaterialStatePropertyAll(
                                                Colors.white),
                                        value:
                                            LanguageCubit.get(context).arabic,
                                        onChanged: (value) {
                                          LanguageCubit.get(context)
                                              .isEnglish();
                                        },
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        customDivider(
                            width: 311.w, color: const Color(0xFF2C2C2E)),
                      ]))
            ],
          ),
        ),
      );
    });
  }
}
