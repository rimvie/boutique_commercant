import 'package:boutique_commercant/const/colors.dart';

import '../const/const.dart';

Widget textNormal({text, coleur= Colors.white, size= 14.0}){
  return "$text".text.color(coleur).size(size).make();
}

Widget boldText({text, coleur= Colors.white, size= 14.0}){
  return "$text".text.semiBold.color(coleur).size(size).make();
}