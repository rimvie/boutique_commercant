import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';




Firebase auth= FirebaseAuth.instance as Firebase;
FirebaseFirestore firestore= FirebaseFirestore.instance;
User? currentUser= FirebaseAuth.instance.currentUser;

//collections

const vendeurCollection = "vendeur";
const produitCollection= "produits";
const chatCollection= "chat";
const messageCollection="message";
const commandeCollection= "commandes";