import 'package:boutique_commercant/Controller/ProduitController.dart';
import 'package:boutique_commercant/service/store_service.dart';
import 'package:boutique_commercant/vus/ecranProduit/AjouterProduit.dart';
import 'package:boutique_commercant/vus/ecranProduit/DetailsProduit.dart';
import 'package:boutique_commercant/widgets/IndicatorChargement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../const/const.dart';
import '../../const/images.dart';
import '../../widgets/appbarWidget.dart';
import '../../widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;

class EcranProduit extends StatelessWidget {
  const EcranProduit({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProduitController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: purpleColor,
            onPressed: () async {
              await controller.voirCategorie();
              controller.remplirListCategorie();
              Get.to(() => AjouterProduit());
            },
            child: Icon(Icons.add)),
        appBar: appbarWidget(produits),
        body: StreamBuilder(
          stream: StoreServices.voirProduits(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return loadingIndicator();
            } else {
              var data = snapshot.data!.docs;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: List.generate(
                        data.length,
                        (index) => Card(
                              child: ListTile(
                                onTap: () {
                                  Get.to(
                                      () => DetailProduit(data: data[index]));
                                },
                                leading: Image.network(
                                    data[index]['p_image'][0],
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover),
                                title: boldText(
                                    text: "${data[index]['p_nom']}",
                                    coleur: fontGrey),
                                subtitle: Row(
                                  children: [
                                    textNormal(
                                        text: "${data[index]['p_prix']}",
                                        coleur: darkGrey),
                                    10.heightBox,
                                    boldText(
                                        text: "${data[index]['is_featured']}",
                                        coleur: greenr)
                                  ],
                                ),
                                trailing: VxPopupMenu(
                                  child: Icon(Icons.more_vert_rounded),
                                  menuBuilder: () => Column(
                                    children: List.generate(
                                        popuMenuTitre.length,
                                        (i) => Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Icon(popuMenuIcon[i],
                                                  color: data[index]["featured_id"] == currentUser!.uid && i == 0 ? Colors.green : darkGrey ,
                                                  ),
                                                  10.widthBox,
                                                  textNormal(
                                                      text:
                                                      data[index]["featured_id"] == currentUser!.uid && i == 0 ? "supprimer des plus vus"  :  popuMenuTitre[i],
                                                      coleur: darkGrey),
                                                ],
                                              ).onTap(() {
                                                switch(i){
                                                  case 0:
                                                    if(data[index]['is_featured'] == true){
                                                      controller.supprimerFeatured(data[index].id);
                                                      VxToast.show(context, msg: "Supprimer");
                                                    }else {
                                                      controller.ajouterFeatured(data[index].id);
                                                      VxToast.show(context, msg: "Ajouter");
                                                    }
                                                    break;
                                                  case 1:
                                                    break;
                                                  case 2:
                                                    controller.supprimerProduit(data[index]!.id);
                                                    VxToast.show(context, msg: "Produit supprimer avec succes");
                                                    break;
                                                  default:
                                                }
                                              }
                                              ),
                                            )),
                                  ).box.white.rounded.width(200).make(),
                                  clickType: VxClickType.singleClick,
                                  //child: const Icon(Icons.more_vert_rounded)
                                ),
                              ),
                            )),
                  ),
                ),
              );
            }
          },
        ));
  }
}
