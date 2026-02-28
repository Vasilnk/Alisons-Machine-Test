import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 30,
    fontFamily: 'Lufga',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle label = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
    fontFamily: 'Lufga',
    fontWeight: FontWeight.w500,
  );

  static const TextStyle input = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 14,
    fontFamily: 'Lufga',
    fontWeight: FontWeight.w400,
  );

  static TextStyle hint = const TextStyle(
    color: Color(0x73222222), // AppColors.textPrimary.withAlpha(115)
    fontSize: 14,
    fontFamily: 'Lufga',
  );

  static const TextStyle button = TextStyle(
    color: AppColors.white,
    fontSize: 20,
    fontFamily: 'Lufga',
    fontWeight: FontWeight.w500,
  );

  static const TextStyle skipButton = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: 'Lufga',
  );

  static const TextStyle link = TextStyle(
    color: AppColors.textPrimary,
    fontFamily: 'Lufga',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  static const TextStyle linkBold = TextStyle(
    color: AppColors.textPrimary,
    fontFamily: 'Lufga',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );
}
