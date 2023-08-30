import 'package:boutique_commercant/const/const.dart';
import 'package:boutique_commercant/vus/Authentification/connexion.dart';
import 'package:boutique_commercant/vus/pagePrincipale/pagePrincipale.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'ecran_debut/debutConnexion.dart';
import 'ecran_debut/debutPrincipale.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key ? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  void initState(){
    super.initState();
    veriUti();
  }

  var connecte=false;

  veriUti()async{
    FirebaseAuth.instance.authStateChanges().listen((User ? user) {
      if(user == null && mounted){
        connecte= false;
      }else{
        connecte=true;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: nomboutique,
      home: connecte ? const DebutPrincipale() : const DebutConnexion(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0
        )
      ),
    );
  }
}


