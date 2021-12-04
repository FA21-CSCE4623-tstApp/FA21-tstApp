import 'package:flutter/material.dart';

const Color appBackground = Color(0xfff9ecdd);
const Color accentColor = mediumPurple;

const Color lightBrown = Color(0xffbdad95);
const Color mediumBrown = Color(0xffab906e);
const Color darkBrown = Color(0xff443727);

Color c = Colors.deepPurpleAccent;
const Color purpleAccent = Color(0xffb388ff);
const Color lightPurple = Color(0xffB39DDB);
const Color mediumPurple = Color(0xff7f6493);
const Color darkPurple = Color(0xff4527A0);

const Color mutedPurple = Color(0xffCE93D8);
const Color mutedIndigo = Color(0xffC5CAE9);
const Color mutedDeepPurple = Color(0xffD1C4E9);

const Color defaultTextColor = Colors.black54;
const Color lightTextColor = Colors.white70;
const Color defaultIconColor = Colors.black54;

const EdgeInsets defaultScreenPadding =
    EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0);
const EdgeInsets defaultSectionPadding = EdgeInsets.symmetric(vertical: 20.0);
const EdgeInsets defaultTextPadding = EdgeInsets.only(top: 10.0, bottom: 10.0);

const TextStyle unselectedTabTextStyle = TextStyle(
  fontSize: 23.0,
  color: defaultTextColor,
);

const TextStyle selectedTabTextStyle = TextStyle(
  fontSize: 23.0,
  color: defaultTextColor,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.underline,
);

BoxDecoration defaultRoundedCorners({Color background = purpleAccent}) {
  return BoxDecoration(
    color: background,
    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
  );
}

const TextStyle defaultChipTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 12.0,
);
