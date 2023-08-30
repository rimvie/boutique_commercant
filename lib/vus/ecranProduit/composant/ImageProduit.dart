import 'package:boutique_commercant/const/colors.dart';
import 'package:boutique_commercant/const/const.dart';
import 'package:boutique_commercant/widgets/text_style.dart';


Widget ImageProduit({required label, onPress}){
  return "$label".text.bold.color(fontGrey).size(16.0).makeCentered().box.color(lightGrey).size(100, 100).roundedSM.make();
}