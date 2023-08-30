import 'package:boutique_commercant/const/images.dart';
import 'package:boutique_commercant/widgets/quiterApplicatio.dart';

import '../../const/const.dart';
import '../../widgets/appbarWidget.dart';
import '../../widgets/bouton_tableauBord.dart';
import '../../widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;

class EcranPrincipale extends StatelessWidget {
  const EcranPrincipale({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => quitterApplication(context));
        return false;
      },
      child: Scaffold(
        appBar: appbarWidget(tBord),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    boutonTableauDeBord(context,
                        titre: produits, nombre: "100", icon: icProduit),
                    boutonTableauDeBord(context,
                        titre: commande, nombre: "30", icon: icCommande)
                  ],
                ),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    boutonTableauDeBord(context,
                        titre: evalution, nombre: "100", icon: icStar),
                    boutonTableauDeBord(context,
                        titre: venteTotal, nombre: "30", icon: icCommande)
                  ],
                ),
                10.heightBox,
                const Divider(),
                10.heightBox,
                boldText(
                    text: produitPopulaire, coleur: Colors.blue, size: 16.0),
                20.heightBox,
                ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                      3,
                      (index) => ListTile(
                            onTap: () {},
                            leading: Image.asset(imgProduit,
                                width: 100, height: 100, fit: BoxFit.cover),
                            title: boldText(
                                text: "Titre produit", coleur: darkGrey),
                            subtitle:
                                textNormal(text: "40000", coleur: Colors.red),
                          )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
