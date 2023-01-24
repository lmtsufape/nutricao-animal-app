///This file should contain all the constants style used in the app
///like texts, fonts, colors, etc.
///you should use the standard naming convention for constants like the following:

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/**FONT CONFIGURATION*/
final kDefaultFontFamily = GoogleFonts.poppins().fontFamily;
final kLabelFontFamily = GoogleFonts.inter().fontFamily;

/**COLORS */
const Color kPrimaryColor = Color(0xFF2E5870);
const Color kBackgroundColor = Color(0xFFE8EFF3);
const Color kSecondaryColor = Color(0xFF1AA3F0);
const Color kDetailColor = Color(0xFFF0951A);
const Color kTextButtonColor = Colors.grey;
const Color kButtom = Colors.green;
const Color kText = Colors.black;
const Color kButtom2 = Colors.red;
const Color kTextFirst = Colors.blueGrey;
const Color kColorBottom = Color.fromARGB(255, 228, 255, 198);
//**LIGHT COLORS */

//**DARK COLORS */
const Color kPrimaryDarkColor = Color(0xFF303841);
const Color kSecondaryDarkColor = Color(0xFF3A4750);
const Color kDarkTextColor = Colors.white;
//**DARK COLORS */

//*GENERAL COLORS*//
const Color kSuccessColor = Colors.greenAccent;
const Color kErrorColor = Colors.redAccent;
const Color kAlertColor = Colors.orangeAccent;
//*GENERAL COLORS*//

//**TEXT STYLES */

const TextStyle kTitle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w900,
  color: kTextButtonColor,
);

const TextStyle kDrawer = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: kBackgroundColor,
);
const TextStyle kDrawerUser = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w700,
  color: kBackgroundColor,
);

const TextStyle kTitle1 = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w900,
  color: kBackgroundColor,
);
const TextStyle kTitle2 = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w900,
);
const TextStyle kBody1 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w900,
);
const TextStyle kBody2 = TextStyle(
  fontSize: 18,
);
const TextStyle kBody3 = TextStyle(
  fontSize: 16,
);
const TextStyle kCaption1 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w900,
);
const TextStyle kCaption2 = TextStyle(
  fontSize: 14,
);
