import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';
import '../const/const.dart';

class ProfileController extends GetxController{


  late QueryDocumentSnapshot snapshotData;

  var profileImgPath = ''.obs;


  var profileImageLink='';

  var isloading= false.obs;

  var nomController= TextEditingController();
  var passwordController= TextEditingController();
  var ancpasswordController= TextEditingController();
  var nouvpasswordController= TextEditingController();




  changeImage(context)async{
    try{
      final img= await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70);
      if(img== null) return;
      profileImgPath.value= img.path;
    }on PlatformException catch (e){
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage()async{
    var nomfile= basename(profileImgPath.value);
    var destination= 'images/${currentUser?.uid}/$nomfile';
    Reference ref= FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImgPath.value));
    profileImageLink= await ref.getDownloadURL();
  }

  updateProfile({nom, password, imgUrl})async{
    var store= firestore.collection(vendeurCollection).doc(currentUser?.uid);
    await store.set({'nom': nom, 'password':password, 'imageUrl': imgUrl},
        SetOptions(merge: true));
    isloading(false);
  }


  changerPasswor({email, password, nouveaupassword}) async{
    final cred= EmailAuthProvider.credential(email: email, password: password);

    await currentUser!.reauthenticateWithCredential(cred).then((value){
      currentUser!.updatePassword(nouveaupassword);
    }).catchError((erro){});
  }


}