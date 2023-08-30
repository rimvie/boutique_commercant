import 'package:boutique_commercant/Controller/ProduitController.dart';
import 'package:boutique_commercant/const/colors.dart';
import 'package:boutique_commercant/const/const.dart';
import 'package:boutique_commercant/widgets/text_style.dart';
import 'package:get/get.dart';


Widget MenuProduit(hint,List<String> list, dropvalue, ProduitController controller){
  return Obx(
        ()=>DropdownButtonHideUnderline(
        child: DropdownButton(
      hint: textNormal(text: "$hint", coleur: fontGrey),
      value: dropvalue.value== '' ? null : dropvalue.value,
      isExpanded: true,
      items: list.map((e){
        return DropdownMenuItem(
        value: e,
          child: e.toString().text.make(),
        );
      }).toList(),
      onChanged: (newValue){
        if(hint == "Categorie"){
          controller.valeursubcategorie.value= '';
          controller.remplirListSubategorie(newValue.toString());
        }
        dropvalue.value= newValue.toString();
      },
    )
    ).box.white.padding(EdgeInsets.symmetric(horizontal: 4)).roundedSM.make(),
  );
}