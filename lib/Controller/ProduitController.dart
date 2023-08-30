import 'package:boutique_commercant/Controller/homeController.dart';
import 'package:boutique_commercant/const/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import '../models/categorie_model.dart';
import 'dart:io';
import 'package:path/path.dart';


class ProduitController extends GetxController{
  var isloading= false.obs;


  var pnomController= TextEditingController();
  var pdescriptionController= TextEditingController();
  var pprixController= TextEditingController();
  var pquantiteController= TextEditingController();


  var listCategorie= <String>[].obs;
  var listSubcategorie= <String>[].obs;
  List<Category> categorie = [];
  var pImagesLien=[];
  var pImageList= RxList<dynamic>.generate(3, (index) => null);


  var valeurcategorie= ''.obs;
  var valeursubcategorie= ''.obs;
  var selectionCouleurIndex= 0.obs;


  voirCategorie()async{
    var data= await rootBundle.loadString("lib/service/categorie_model.json");
    var cat =  categoryModelFromJson(data);
    categorie= cat.categories;
  }

  remplirListCategorie(){
    listCategorie.clear();

    for(var item in categorie){
      listCategorie.add(item.nom);
    }
  }

  remplirListSubategorie(cat){
    listSubcategorie.clear();

    var data= categorie.where((element) => element.nom== cat).toList();
    for(var i = 0; i<data.first.subCategory.length; i++){
      listSubcategorie.add(data.first.subCategory[i]);
    }
  }

  pickImage(index, context) async{
    try{
      final img= await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 80);
      if(img== null){
        return;
      }else{
        pImageList[index]=File(img.path);
      }
    } catch (e){
      VxToast.show(context, msg: e.toString());
    }
  }



  uploadImages() async {
    pImagesLien.clear();
    for(var item in pImageList){
      if(item!=null){
        var filename= basename(item.path);
        var destination= 'images/vendeur/${currentUser!.uid}/$filename';
        Reference ref = FirebaseStorage.instance.ref().child(destination);
        await ref.putFile(item);
        var n= await ref.getDownloadURL();
        pImagesLien.add(n);
      }
    }
  }




  uploadProduits(context)async{
    var store = FirebaseFirestore.instance.collection(produitCollection).doc();
    await store.set({
      'is_featured': false,
      'p_categorie': valeurcategorie.value,
      'p_subcategory': valeursubcategorie.value,
      'p_couleur':FieldValue.arrayUnion([Colors.red.value, Colors.brown.value]),
      'p_image': FieldValue.arrayUnion(pImagesLien),
      'p_liste':FieldValue.arrayUnion([]),
      'p_description': pdescriptionController.text,
      'p_nom': pnomController.text,
      'p_prix': pprixController.text,
      'p_quantite':pquantiteController.text,
      'p_vendeur':Get.put(HomeController()).nomvendeur,
      'p_evolution': "5.0",
      'id_vendeur':currentUser!.uid,
      'featured_id':'',
    });

    isloading(false);
    VxToast.show(context, msg: "Produit aouter");
  }



  ajouterFeatured(docId)async{
    await FirebaseFirestore.instance.collection(produitCollection).doc(docId).set({
      'featured_id':currentUser!.uid,
      'is_featured': true,
    }, SetOptions(merge: true));
  }


  supprimerFeatured(docId)async{
    await FirebaseFirestore.instance.collection(produitCollection).doc(docId).set({
      'featured_id':'',
      'is_featured': false,
    }, SetOptions(merge: true));
  }

  supprimerProduit(docId) async{
    await FirebaseFirestore.instance.collection(produitCollection).doc(docId).delete();
  }

}
