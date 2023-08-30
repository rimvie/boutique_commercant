import 'package:boutique_commercant/vus/Authentification/politique.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../Controller/AuthController.dart';
import '../../const/const.dart';
import '../../const/styles.dart';
import '../../widgets/animation.dart';
import '../../widgets/button.dart';
import '../pagePrincipale/pagePrincipale.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {

  var nomComplet = "";
  var email= "";
  var password="";
  var confirm="";
  bool confirmToggle = true;
  var confirmPassword = "";
  final _formfield = GlobalKey<FormState>();

  bool passToogle = true;
  bool? isCheck = false;

  var controller = Get.put(AuthController());


  var nomController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();



  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formfield,
          child: Column(
            children: [
              AppliquerAnimation(
                delay: 1000,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 190,
                  width: 280,
                  child: Lottie.asset("assets/animations/6.json"),
                ),
              ),
              Divider(height: 10, color: darkGrey,),
              10.heightBox,
              AppliquerAnimation(
                delay: 1500,
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  width: w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 7,
                                  offset: Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.2))
                            ]),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: nomController,
                          decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.blueAccent,
                              size: 15,
                            ),
                            labelText: "Nom",
                            hintText: "Entrer votre nom et prénom",
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              nomComplet = value;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Entrer un nom valide";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      5.heightBox,
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 7,
                                  offset: Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.2))
                            ]),
                        child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              isDense: true,
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.blueAccent,
                                size: 15,
                              ),
                              labelText: "Email",
                              hintText: "Entrer votre Email",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Entrer un email";
                              } else if (!value.contains('@')) {
                                return "Email non valide";
                              } else if (!value.contains('.com')) {
                                return "Email invalide";
                              }
                            }),
                      ),
// Initialisation de notre container pour la case email
                      SizedBox(height: 8),

// Initialisation de notre container pour la case email
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 7,
                                  offset: Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.2))
                            ]),
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Icon(Icons.lock,
                                color: Colors.redAccent, size: 15),
                            labelText: "Mot de passe",
                            hintText: "Entrer votre Mot de passe",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            suffix: InkWell(
                              onTap: () {
                                setState(() {
                                  passToogle = !passToogle;
                                });
                              },
                              child: Icon(passToogle
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Entrer un mot de passe";
                            } else if (passwordController.text.length < 6) {
                              return "Mot de passe trop court";
                            }
                          },
                          obscureText: passToogle,
                        ),
                      ),

                      5.heightBox,

                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 7,
                                  offset: Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.2))
                            ]),
                        child: TextFormField(
                          controller: confirmController,
                          decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Icon(Icons.lock,
                                color: Colors.redAccent, size: 15),
                            labelText: "Confirmer",
                            hintText: "Confirmer votre Mot de passe",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                            suffix: InkWell(
                              onTap: () {
                                setState(() {
                                  confirmToggle = !confirmToggle;
                                });
                              },
                              child: Icon(confirmToggle
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              confirmPassword = value;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Confirmer votre mot de passe";
                            } else if (value!.length < 6) {
                              return "mot de passe trop court";
                            } else if (passwordController.text != value) {
                              return "le mot de passe ne correspond pas";
                            }
                            return null;
                          },
                          obscureText: confirmToggle,
                        ),
                      ),
// Initialisation de notre container pour la case email
                    ],
                  ),
                ),
              ),
              AppliquerAnimation(
                delay: 2000,
                child: Container(
                  child: Row(
                    children: [
                      Checkbox(
                          checkColor: Colors.red,
                          value: isCheck,
                          onChanged: (newValue) {
                            setState(() {
                              isCheck = newValue!;
                            });
                          }),
                      5.heightBox,
                      Expanded(
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "j'accepte tous ",
                                style:
                                TextStyle(fontFamily: bold, color: fontGrey)),
                            TextSpan(
                                text: privacityPolicy,
                                style:
                                TextStyle(fontFamily: bold, color: Colors.red)),

                          ]),
                        ).onTap(() {
                          Get.to(()=>PolitiqueConfidentialite());
                        }),
                      ),

                    ],
                  ),
                ),
              ),
              5.heightBox,
              AppliquerAnimation(
                delay: 2500,
                child: GestureDetector(
                  onTap: () async {

                  },
                  child: Container(
                    height: 53,
                    width: 200,
                    child: button(
                        color: isCheck == true ? redColor : lightGrey,
                        title: incrireIns,
                        textColor: white,
                        onPress: () async {
                          if (isCheck != false) {
                            try {
                              await controller
                                  .inscriptionMethod(
                                  context: context,
                                  email: emailController.text,
                                  password: passwordController.text)
                                  .then((value) {
                                return controller.histDonnUti(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  nom: nomController.text,
                                );
                              }).then((value) {
                                VxToast.show(context, msg: inscrireussie);
                                Get.offAll(() =>const PagePrincipale());
                              });
                            } catch (e) {
                              FirebaseAuth.instance.signOut();
                              VxToast.show(context, msg: e.toString());
                            }
                          }
                          if (_formfield.currentState!.validate()) {
                            setState(() {
                              email=emailController.text;
                              password= passwordController.text;
                              nomComplet= nomController.text;
                              confirm= confirmController.text;
                            });
                          }
                        }).box.width(context.screenWidth - 50).make(),
                  ),
                ),
              ),
              15.heightBox,
              AppliquerAnimation(
                delay: 3000,
                child: Container(
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: vousAvez,
                              style: TextStyle(fontFamily: bold, color: fontGrey)),
                          TextSpan(
                              text: connecter,
                              style: TextStyle(fontFamily: bold, color: redColor, fontSize: 16)),
                        ])).onTap(() {
                      Get.back();
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
