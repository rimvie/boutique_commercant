import 'package:boutique_commercant/const/firebase_constante.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{


  @override
  void onInit() {
    super.onInit();
    voirNomvendeur();
  }

  var navIndex= 0.obs;
  var nomvendeur='';





  voirNomvendeur()async{
    var n = await FirebaseFirestore.instance.collection(vendeurCollection).where('id', isEqualTo: currentUser?.uid).get().then((value){
      if(value.docs.isNotEmpty){
        return value?.docs.single['nom_vendeur'];
      }
    });
    nomvendeur = n ?? '';
  }



}