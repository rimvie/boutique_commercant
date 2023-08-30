import 'package:boutique_commercant/Controller/ProduitController.dart';
import 'package:boutique_commercant/vus/ecranProduit/composant/MenuProduit.dart';
import 'package:boutique_commercant/widgets/texfield_client.dart';
import 'package:boutique_commercant/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../const/const.dart';
import '../../widgets/IndicatorChargement.dart';
import 'composant/ImageProduit.dart';

class AjouterProduit extends StatelessWidget {
  const AjouterProduit({super.key});

  @override
  Widget build(BuildContext context) {

    var controller= Get.put(ProduitController());

    return Obx(()=> Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back, color: white),
          ),
          title:
              boldText(text: "Ajouter un produit", coleur: white, size: 16.0),
          actions: [
           controller.isloading.value ? loadingIndicator(circularColor: white): TextButton(
                onPressed: () async{
                  controller.isloading(true);
                  await controller.uploadImages();
                  await controller.uploadProduits(context);
                  Get.back();
                },
                child: boldText(text: "Enregistrer", coleur: white))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClientTextfield(label: "Nom produit", hint: "", controller: controller.pnomController),
                10.heightBox,
                ClientTextfield(label: "Description", hint: "", isDesc: true, controller: controller.pdescriptionController),
                10.heightBox,
                ClientTextfield(label: "Prix", hint: "", controller: controller.pprixController),
                10.heightBox,
                ClientTextfield(label: "Quantité", hint: "", controller: controller.pquantiteController),
                10.heightBox,
                MenuProduit("Categorie", controller.listCategorie, controller.valeurcategorie, controller),
                10.heightBox,
                MenuProduit("Sous categorie", controller.listSubcategorie, controller.valeursubcategorie, controller),
                10.heightBox,
                const Divider(color: white,),
                textNormal(text: "Choisir une image"),
                10.heightBox,
                Obx(()=> Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        3,
                        (index) => controller.pImageList[index] !=null
                            ? Image.file(controller.pImageList[index], width: 100).onTap(() {
                              controller.pickImage(index, context);
                        })
                            : ImageProduit(label: "${index + 1}").onTap(() {
                              controller.pickImage(index, context);
                            })
                    ),
                  ),
                ),
                10.heightBox,
                Obx(
                      ()=>Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: List.generate(
                        9,
                        (index) => Stack(
                              alignment: Alignment.center,
                              children: [
                                VxBox().color(Vx.randomOpaqueColor).roundedFull.size(50, 50).make().onTap(() {
                                  controller.selectionCouleurIndex.value = index;
                                }),
                                controller.selectionCouleurIndex.value == index
                                    ? const Icon(Icons.done, color: white)
                                    : const SizedBox() ,

                              ],
                            )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
