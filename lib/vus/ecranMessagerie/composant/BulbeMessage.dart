import 'package:boutique_commercant/widgets/text_style.dart';

import '../../../const/const.dart';

Widget BulbeMessage(){
  return Directionality(
    textDirection: TextDirection.ltr,
    //textDirection: data['uid'] == currentUser!.uid ? TextDirection.rtl : TextDirection.ltr,
    child: Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: purpleColor,
        //color: data['uid'] == currentUser!.uid ? redColor : darkFontGrey,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20)
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textNormal(text: "Votre message"),
          //"${data['msg']}".text.white.size(16).make(),
          10.heightBox,
          //time.text.color(whiteColor.withOpacity(0.5)).make()
          textNormal(text: "11:22AM"),
        ],
      ),
    ),
  );
}