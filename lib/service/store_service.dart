import 'package:boutique_commercant/const/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoreServices{
  static voirProfiles(uid){
    return FirebaseFirestore.instance.collection(vendeurCollection).where('id', isEqualTo: uid).get();
  }


  static voirProduits(uid){
    return FirebaseFirestore.instance.collection(produitCollection).where('id_vendeur', isEqualTo: uid).snapshots();
  }
}