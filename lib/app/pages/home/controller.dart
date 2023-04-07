import 'package:bmi_calculator/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxDouble heightValue = 70.0.obs;
  RxInt weight = 65.obs;
  RxInt age = 25.obs;
  Rx<Color> maleColor = AppColors.inactiveColor.obs;
  Rx<Color> femaleColor = AppColors.inactiveColor.obs;

  changeMaleColor() {
    maleColor.value = AppColors.activeColor;
    femaleColor.value = AppColors.inactiveColor;
  }

  changeFemaleColor() {
    femaleColor.value = AppColors.activeColor;
    maleColor.value = AppColors.inactiveColor;
  }

  weightPlus() {
    weight.value++;
  }

  weightMinus() {
    weight.value--;
  }

  agePlus() {
    age.value++;
  }

  ageMinus() {
    age.value--;
  }
}
