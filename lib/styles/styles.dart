import 'package:flutter/material.dart';

//styles of text and boxdecoration given through email
const bubbleDiameter = 272;

const bubbleBoxDecoration = BoxDecoration(
  color: Color(0xff53a99a),
  shape: BoxShape.circle,
  boxShadow: [
    BoxShadow(
      offset: Offset(0, 27),
      blurRadius: 33,
      color: Color(0x3827ae96),
    )
  ],
);

const labelTextStyle = TextStyle(
  fontFamily: 'Helvetica',
  fontWeight: FontWeight.bold,
  fontSize: 17,
  color: Colors.white,
);

const weightTextStyle = TextStyle(
    fontFamily: 'League Gothic',
    fontWeight: FontWeight.normal,
    fontSize: 100,
    color: Colors.white,
    letterSpacing: .01);

const unitTextStyle = TextStyle(
  fontFamily: 'League Gothic',
  fontSize: 30,
  color: Color(0x80ffffff),
);
