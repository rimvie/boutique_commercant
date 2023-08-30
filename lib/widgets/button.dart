import 'package:boutique_commercant/const/const.dart';
import 'package:flutter/material.dart';

Widget button({onPress, color, textColor, String? title}) {
  return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: title?.text.color(textColor).size(25).make());
}
