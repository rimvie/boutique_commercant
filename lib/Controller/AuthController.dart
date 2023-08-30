import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../const/const.dart';

class AuthController extends GetxController{

  var isloading= false.obs;

  var emaillController= TextEditingController();
  var passswordlController= TextEditingController();



// methode de conexion des utilsateurs
  Future<UserCredential?> connexionMethod({context}) async{
    UserCredential? userCredential;
    try{
      userCredential= await FirebaseAuth.instance.signInWithEmailAndPassword(email: emaillController.text, password: passswordlController.text);
    } on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }







  // methode de creation de compte des utlisateurs
  Future<UserCredential?> inscriptionMethod({email, password, context}) async{
    UserCredential? userCredential;
    try{
      userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }


  // historique de données, ici dans firebase on verra la liste des utilisateurs connceté avec comme parents le 'utilisateurs' declaré dans firebase_conts
// ici nous recuperons les informations consernant l'utilisateur
  histDonnUti({nom, password, email})async {
    DocumentReference hist= await FirebaseFirestore.instance.collection(vendeurCollection).doc(currentUser!.uid);
    hist.set({
      'nom': nom,
      'password': null,
      'email': email,
      'imageUrl': " ",
      'id': currentUser?.uid,
    });
  }





// methode de quitter l'application
// cette metthode est appéler dans un bouton, une fois cliquer sur le boutton, l'utilisateur sera rédirigé vers la page de connexion
  quitterMetho(context)async{
    try{
      await FirebaseAuth.instance.signOut();
    } catch (e){
      VxToast.show(context, msg: e.toString());
    }
  }

}