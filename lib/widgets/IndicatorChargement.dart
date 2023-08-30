import 'package:boutique_commercant/const/const.dart';

Widget loadingIndicator({circularColor= purpleColor }){
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(circularColor),
    ),
  );
}