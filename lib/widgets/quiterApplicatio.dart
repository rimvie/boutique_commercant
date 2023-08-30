import 'package:flutter/services.dart';

import '../const/const.dart';
import '../const/styles.dart';
import 'button.dart';

Widget quitterApplication(context) {
  return Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirmer".text.fontFamily(bold).size(18).color(darkGrey).make(),
        Divider(),
        10.heightBox,
        "Etes vous sur de vouloir quitter ?"
            .text
            .size(16)
            .color(darkGrey)
            .make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            button(
                color: Colors.white,
                onPress: () {
                  SystemNavigator.pop();
                },
                textColor: Colors.black,
                title: "Oui"),
            button(
                color: Colors.white,
                onPress: () {
                  Navigator.pop(context);
                },
                textColor: Colors.black,
                title: "Non"),
          ],
        )
      ],
    ).box.color(Colors.white).padding(EdgeInsets.all(12)).make(),
  );
}