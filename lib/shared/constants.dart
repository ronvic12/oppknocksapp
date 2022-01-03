import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white38,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black26, width: 1.0)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 1.0)),
);

final Color appColor1 = HexColor('#63ADCD');
final Color appColor2 = HexColor('#C2E4F0');
