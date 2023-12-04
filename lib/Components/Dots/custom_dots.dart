import 'package:fitzapp/Constants/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OnBoardingDots extends StatelessWidget {
  OnBoardingDots({super.key, this.currentIndex});
  int? currentIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          FitzConstants.onBoardingImages.length,
          (index) => Container(
            height: 10,
            width: 10,
            margin: const EdgeInsets.only(right: 7.7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: currentIndex == index ? Colors.white : Colors.grey,
            ),
          ),
        ));
  }
}
