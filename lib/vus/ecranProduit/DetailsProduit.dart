import 'package:boutique_commercant/const/images.dart';
import 'package:boutique_commercant/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../const/const.dart';

class DetailProduit extends StatelessWidget {

  final dynamic data;

  const DetailProduit({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: darkGrey),
        ),
        title: boldText(text: "${data['p_nom']}", coleur: fontGrey, size: 16.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
                autoPlay: true,
                height: 250,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                itemCount: data['p_image'].length,
                itemBuilder: (context, index) {
                  return Image.network(data['p_image'][index]);
                }),
            10.heightBox,

            // titre pour la section de details
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(text: "${data['p_nom']}", coleur: fontGrey, size: 16.0),
                  10.heightBox,
                  Row(
                    children: [
                      boldText(text: "${data['p_categorie']}", coleur: fontGrey, size: 16.0),
                      10.widthBox,
                      boldText(text: "${data['p_subcategory']}", coleur: fontGrey, size: 16.0),
                    ],
                  ),
                  10.heightBox,
                  // Choix du nombre d'etoile pour un produit donné
                  VxRating(
                    isSelectable: false,
                    value: double.parse(data['p_evolution']),
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    maxRating: 5,
                    size: 25,
                  ),
                  10.heightBox,
                  boldText(text: "${data['p_prix']}", coleur: red, size: 18.0),
                  20.heightBox,
                  Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: boldText(text: "Couleur", coleur: fontGrey),
                            ),
                            Row(
                              children: List.generate(
                                  3,
                                      (index) => VxBox()
                                          .size(40, 40)
                                          .roundedFull
                                      .color(Color(data['p_couleur'][index]))
                                          .margin(EdgeInsets.symmetric(
                                          horizontal: 4))
                                          .make()
                                          .onTap(() {
                                      }
                                      ),
                              ),
                            )
                          ],
                        ),
                        10.heightBox,
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: textNormal(text: "Quantité", coleur: fontGrey),
                            ),
                            textNormal(text: "${data['p_quantite']} disponibles", coleur: fontGrey),
                          ],
                        ),
                      ],
                    ).box.white.padding(EdgeInsets.all(8)).make(),
                  const Divider(),
                  20.heightBox,

                  boldText(text: "Description", coleur: fontGrey),
                  10.heightBox,
                  textNormal(text: "${data['p_description']}", coleur: fontGrey),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
