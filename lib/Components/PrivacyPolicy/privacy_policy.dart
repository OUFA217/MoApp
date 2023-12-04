import 'package:fitzapp/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  bool boolAcceptingConditions = false;

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
        if (!boolAcceptingConditions) {
          return 'You need to accept terms';
        } else {
          return null;
        }
      },
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  boolAcceptingConditions = !boolAcceptingConditions;
                });
              },
              child: Row(
                children: [
                  Checkbox(
                    checkColor: Colors.grey,
                    shape: const CircleBorder(),
                    value: boolAcceptingConditions,
                    splashRadius: 2.r,
                    fillColor: const MaterialStatePropertyAll(Colors.white),
                    onChanged: (value) {
                      setState(() {
                        state.didChange(value);
                      });
                    },
                  ),
                  Text(
                    FitzConstants.acceptPrivacyPolicy,
                    style: GoogleFonts.inter(
                        color: const Color.fromRGBO(146, 153, 163, 100),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0.w),
              child: Text(
                state.errorText ?? '',
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
