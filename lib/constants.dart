import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorConstance{
  static const Color backgroundColor= Color(0xFF0C0C0C);
  static const Color selectedColor= Color(0xFFB7EE2E);
  static const Color unselectedColor= Color(0xFF1D1D1F);
}

ThemeData myTheme = ThemeData(
  scaffoldBackgroundColor: ColorConstance.backgroundColor,
  appBarTheme: const AppBarTheme(
    color: ColorConstance.backgroundColor,
    iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
    elevation: 0,
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.dmSans(
      fontSize: 26.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.dmSans(
      fontSize: 20.sp,
      color: Colors.white,
    ),
  ),
);