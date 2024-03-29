import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF181818);
const Color bgColor = Color.fromRGBO(15, 15, 15, 1.0);

const Color buttonColor = Color(0xff69E4EC);

const Color iconColor = Color.fromRGBO(124, 124, 124, 1);
const Color cardColor = Color.fromRGBO(27, 27, 27, 1);
const Color textColor = Color(0xffffffff);

//30
TextStyle salutationTextStyle(double size, Color color) => GoogleFonts.epilogue(
      textStyle: TextStyle(
        color: color,
        height: 2,
        fontSize: size,
        fontWeight: FontWeight.w700,
      ),
    );
//72 when big
// 48 when mobile size
TextStyle titleText(double size, Color color) => GoogleFonts.epilogue(
      textStyle: TextStyle(
        color: color,
        height: 1.2,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
//24
TextStyle normalText(double size, Color color) => GoogleFonts.epilogue(
      textStyle: TextStyle(
          color: color, fontSize: size, fontWeight: FontWeight.normal),
    );
