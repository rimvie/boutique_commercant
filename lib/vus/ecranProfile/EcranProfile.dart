import 'package:boutique_commercant/Controller/AuthController.dart';
import 'package:boutique_commercant/Controller/ProfileController.dart';
import 'package:boutique_commercant/const/const.dart';
import 'package:boutique_commercant/const/images.dart';
import 'package:boutique_commercant/service/store_service.dart';
import 'package:boutique_commercant/vus/Authentification/connexion.dart';
import 'package:boutique_commercant/vus/ecranMessagerie/EcranMessagerie.dart';
import 'package:boutique_commercant/vus/ecranParamettre/EcranParametre.dart';
import 'package:boutique_commercant/vus/ecranProfile/editerprofile.dart';
import 'package:boutique_commercant/widgets/IndicatorChargement.dart';
import 'package:boutique_commercant/widgets/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../const/const.dart';
import '../../const/lists.dart';

class EcranProfile extends StatelessWidget {
  const EcranProfile({super.key});

  @override
  Widget build(BuildContext context) {


    var controller= Get.put(ProfileController());
    return  Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: boldText(
          text: parametre, size: 16.0
        ),
        actions: [
          IconButton(onPressed: (){
            Get.to(()=>EditerProfile(
              //username: controller.snapshotData['nom_vendeur'],
            ));

          }, icon: const Icon(Icons.edit)),
          TextButton(onPressed: () async{
            await Get.find<AuthController>().quitterMetho(context);
            Get.offAll(()=>Connexion());
          }, child: textNormal(text: quitter)),
        ],
      ),
      body: FutureBuilder(
        future: StoreServices.voirProfiles(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData){
            return loadingIndicator(circularColor: white);
          }else{

            //controller.snapshotData= snapshot.data!.docs;

            return Column(
              children: [
                ListTile(
                  leading: Image.asset(imgProduit).box.roundedFull.clip(Clip.antiAlias).make(),
                  title: boldText(text: /*"${controller.snapshotData['nom_vendeur']}"*/"Nom vendeur"),
                  subtitle: textNormal(text:/*${controller.snapshotData['email']}*/ "vendeur@gmail.com"),
                ),
                const Divider(),
                10.heightBox,
                Padding(padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: List.generate(profileBoutonIcon.length, (index) => ListTile(
                      onTap: (){
                        switch (index){
                          case 0:
                            Get.to(()=>ParamettreBoutique());
                            break;
                          case 1:
                            Get.to(()=>EcranMeassagerie());
                            break;
                          default:
                        }
                      },
                      leading: Icon(profileBoutonIcon[index], color: white),
                      title: textNormal(text: profileBoutonTitre[index]),
                    )),
                  ),
                ),
              ],
            );
          }
        },
      )

    );
  }
}
