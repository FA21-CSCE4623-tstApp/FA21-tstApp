import 'package:flutter/material.dart';

const Color appBackground = Color(0xfff9ecdd);
const Color accentColor = mediumPurple;

const Color lightBrown = Color(0xffbdad95);
const Color mediumBrown = Color(0xffab906e);
const Color darkBrown = Color(0xff443727);

const Color lightPurple = Color(0xffB39DDB);
const Color mediumPurple = Color(0xff7f6493);
const Color darkPurple = Color(0xff4527A0);

const Color defaultTextColor = Colors.black54;
const Color lightTextColor = Colors.white70;
const Color defaultIconColor = Colors.black54;

const EdgeInsets defaultScreenPadding = EdgeInsets.all(20.0);
const EdgeInsets defaultSectionPadding = EdgeInsets.symmetric(vertical: 20.0);
const EdgeInsets defaultTextPadding = EdgeInsets.only(top: 10.0, bottom: 10.0);

const TextStyle defaultWidgetTextStyle = TextStyle(
  fontSize: 23.0,
  color: defaultTextColor,
);

final BoxDecoration defaultRoundedCorners = BoxDecoration(
  color: lightPurple,
  borderRadius:
  BorderRadius.all(Radius.circular(10.0)),
);

const TextStyle defaultChipTextStyle = TextStyle(
  color: lightTextColor,
  fontSize: 12.0,
);