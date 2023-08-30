import 'dart:io';
import 'package:boutique_commercant/Controller/ProfileController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../const/const.dart';
import '../../const/images.dart';
import '../../widgets/texfield_client.dart';
import '../../widgets/text_style.dart';

class EditerProfile extends StatefulWidget {
  final String? username;

  const EditerProfile({super.key, this.username});

  @override
  State<EditerProfile> createState() => _EditerProfileState();
}

class _EditerProfileState extends State<EditerProfile> {
  var controller= Get.find<ProfileController>();

  /*@override
  void initState(){
    controller.nomController.text= widget.username!;
    super.initState();
  }*/



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: boldText(text: editerProfile, size: 16.0),
        actions: [
          TextButton(onPressed: (){}, child: textNormal(text: enregistrer)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            children: [

              Image.asset(imgProduit, width: 120).box.roundedFull.clip(Clip.antiAlias).make(),

              /*controller.snapshotData['imageUrl']!= '' && controller.profileImgPath.isEmpty

              ?Image.asset(imgProduit, width: 100, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()

              : controller.snapshotData['imageUrl'] !=''&& controller.profileImgPath.isEmpty

              ?Image.network(
                  controller.snapshotData['imageUrl'],
                  width: 100,
                  fit: BoxFit.cover
              ).box.roundedFull.clip(Clip.antiAlias).make()
              :Image.file(File(controller.profileImgPath.value), width: 100, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),*/


              10.heightBox,
              ElevatedButton(
                  onPressed: (){
                    controller.changeImage(context);
                  },
                  child: textNormal(text: "Changer image",coleur: fontGrey),
                style: ElevatedButton.styleFrom(
                  backgroundColor: white,
                ),
              ),
              10.heightBox,
              const Divider(height: 20, color: white),
              ClientTextfield(label: nomBoutique, hint: "Rimvie freeshop", controller: controller.nomController),

              Align(
                  alignment: Alignment.centerLeft,
                  child: boldText(text: "Changer votre mot de passe")),
              10.heightBox,
              ClientTextfield(label: password, hint: hintPassword, controller: controller.ancpasswordController),
              10.heightBox,
              ClientTextfield(label: confirmer, hint: hintConfirmer, controller: controller.nouvpasswordController)
            ],
          ),
        ),
      ),
    );
  }
}
