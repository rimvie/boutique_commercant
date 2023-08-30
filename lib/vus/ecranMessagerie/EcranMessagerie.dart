import 'package:boutique_commercant/vus/ecranMessagerie/Message.dart';
import 'package:boutique_commercant/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../const/const.dart';

class EcranMeassagerie extends StatelessWidget {
  const EcranMeassagerie({super.key});

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
        title: boldText(text: messagerie, size: 16.0, coleur: fontGrey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: List.generate(20, (index) => ListTile(
              onTap: (){
                Get.to(()=>Message());
              },
              leading: CircleAvatar(
                backgroundColor: purpleColor,
                child: Icon(Icons.person, color: white),
              ),
              title: boldText(text: "Nom client", coleur: fontGrey),
              subtitle: textNormal(text: "dernier message", coleur: darkGrey),

              // le text a gauche de l'ecran
              trailing: textNormal(text: "10:54AM", coleur: darkGrey),
              // fin text gauche écran
            ))
          ),
        ),
      ),
    );
  }
}
