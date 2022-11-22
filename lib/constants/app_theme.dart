import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './custom_transition.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomPageTransitionBuilder(),
      },
    ),
    primaryColor: const Color(0xFF4426A8),
    errorColor: Colors.redAccent,
    canvasColor: Colors.grey,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: const Color(0xFF5263F0),
      errorColor: Colors.red,
    ),
    indicatorColor: const Color(0xFFF6BC18),
    textTheme: TextTheme(
      headline1: GoogleFonts.inter(
          fontSize: 93,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
          color: const Color(0xFF4426A8)),
      headline2: GoogleFonts.inter(
          fontSize: 58,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
          color: const Color(0xFF1D1D1D)),
      headline3: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF1D1D1D)),
      headline4: GoogleFonts.inter(
          fontSize: 33,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.25,
          color: const Color(0xFFFFFFFF)),
      headline5: GoogleFonts.inter(
          fontSize: 23,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF1D1D1D)),
      headline6: GoogleFonts.inter(
          fontSize: 19,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: const Color(0xFF4426A8)),
      subtitle1: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: const Color(0xFFFB9ED2)),
      subtitle2: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: const Color(0xFFFF9800)),
      bodyText1: GoogleFonts.openSans(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: const Color(0xFF1D1D1D).withOpacity(0.5)),
      bodyText2: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: const Color(0xFF1D1D1D).withOpacity(0.5)),
      button: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
          color: Colors.white),
      caption: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: const Color(0xFF1D1D1D).withOpacity(0.5)),
      overline: GoogleFonts.openSans(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: const Color(0xFF1D1D1D).withOpacity(0.5)),
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: const Color(0xFF4426A8).withOpacity(0.4),
      selectionHandleColor: const Color(0xFF4426A8),
      cursorColor: const Color(0xFF4426A8),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 10, backgroundColor: Color(0xFF4426A8)),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.grey,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: false,
      hintStyle: GoogleFonts.openSans(
        color: const Color(0xFFD0D0D0),
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25,
      ),
      labelStyle: GoogleFonts.openSans(
        color: const Color(0xFFD0D0D0),
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25,
      ),
      floatingLabelStyle: GoogleFonts.openSans(
        color: const Color(0xFFD0D0D0),
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25,
      ),
      isCollapsed: false,
      // isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: const Color(0xFFD0D0D0).withOpacity(0.3),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFF4426A8),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.redAccent,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.redAccent,
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(const Color(0xFF4426A8)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return const Color(0xFF4426A8).withOpacity(0.7);
          } else {
            return const Color(0xFF4426A8);
          }
        }),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 56)),
        shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(
                width: 1.5, color: const Color(0xFFD0D0D0).withOpacity(0.7));
          } else {
            return const BorderSide(width: 1.5, color: Color(0xFFD0D0D0));
          }
        }),
        foregroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFF1D1D1D).withOpacity(0.5)),
        maximumSize: MaterialStateProperty.all(const Size(double.infinity, 56)),
        minimumSize: MaterialStateProperty.all(const Size(120, 56)),
        shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      ),
    ),
  );
}
