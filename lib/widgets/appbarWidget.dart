import 'package:boutique_commercant/const/colors.dart';
import 'package:boutique_commercant/const/const.dart';
import 'package:boutique_commercant/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../const/string.dart';

AppBar appbarWidget(titre){
  return  AppBar(
    backgroundColor: white,
    title: boldText(text: titre, coleur: fontGrey, size: 16.0),
    actions: [
      Center(
          child: boldText(
              text: intl.DateFormat('EEE, MMM d,' ' yy')
                  .format(DateTime.now()),
              coleur: purpleColor)),
      10.widthBox,
    ],
  );
}