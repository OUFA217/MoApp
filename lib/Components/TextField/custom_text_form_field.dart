import 'package:country_code_picker/country_code_picker.dart';
import 'package:fitzapp/Features/Authentication/SignUp/sign_up_cubit.dart';
import 'package:fitzapp/Features/Authentication/SignUp/sign_up_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.isPassword = false,
    this.isPhoneNumber = false,
    this.countryCode,
    required this.valueEmpty,
    required this.controller,
    required this.labelText,
    required this.textInputType,
  });
  final bool? isPassword;
  final bool? isPhoneNumber;
  final String? valueEmpty;
  final TextInputType? textInputType;
  final String? labelText;
  final String? countryCode;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, InitialSignUpState>(
        builder: (context, state) {
      return TextFormField(
        style: GoogleFonts.inter(
            color: Colors.grey, fontSize: 14.sp, fontWeight: FontWeight.w400),
        controller: controller,
        obscureText: isPassword!,
        validator: (value) => value!.isEmpty ? valueEmpty : null,
        keyboardType: textInputType,
        decoration: InputDecoration(
            isDense: isPhoneNumber == true ? true : false,
            prefixIcon: isPhoneNumber == true
                ? Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: CountryCodePicker(
                      textStyle: GoogleFonts.inter(
                          color: Colors.grey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                      onChanged: (value) {
                        SignUpCubit.get(context)
                            .getCountryCode(value.toString());
                      },
                      initialSelection: 'EG',
                      favorite: const ['+20', 'EG'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                    ),
                  )
                : null,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.r))),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              gapPadding: 10.w,
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(4.r))),
            labelText: labelText,
            labelStyle: GoogleFonts.inter(
                color: Colors.grey,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400)),
      );
    });
  }
}
