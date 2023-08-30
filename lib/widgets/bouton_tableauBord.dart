import 'package:boutique_commercant/const/colors.dart';
import 'package:boutique_commercant/widgets/text_style.dart';

import '../const/const.dart';
import '../const/images.dart';

Widget boutonTableauDeBord(context, {titre, nombre, icon}){

  var size= MediaQuery.of(context).size;
  return  Row(
    children: [
      Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              boldText(text: titre, size: 16.0),
              boldText(text: nombre, size: 20.0)
            ],
          )),
      Image.asset(icon, width: 40, color: white),
    ],
  )
      .box
      .color(Colors.blue)
      .rounded
      .size(size.width * 0.4, 80)
      .padding(const EdgeInsets.all(8))
      .make();
}