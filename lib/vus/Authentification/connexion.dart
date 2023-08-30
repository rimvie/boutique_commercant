import 'package:boutique_commercant/vus/Authentification/Inscription.dart';
import 'package:boutique_commercant/widgets/IndicatorChargement.dart';
import 'package:boutique_commercant/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../Controller/AuthController.dart';
import '../../const/const.dart';
import '../../widgets/animation.dart';
import '../../widgets/button.dart';
import '../pagePrincipale/pagePrincipale.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

final _formfield = GlobalKey<FormState>();
class _ConnexionState extends State<Connexion> {


  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var email= "";
  var password="";
  bool passToogle = true;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Form(
          key: _formfield,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              150.heightBox,
              AppliquerAnimation(
                  delay: 2000,
                child: Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 220,
                    width: 280,
                  child: Lottie.asset("assets/animations/6.json")
                ),
              ),
              5.heightBox,
              AppliquerAnimation(
                delay: 2500,
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
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 7,
                                  offset: Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.2))
                            ]),
                        child: TextFormField(
                            controller: controller.emaillController,
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
                      )         ,
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
                          controller: controller.passswordlController,
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
                              return "Mot de passe incorrect";
                            }else{
                              return null;
                            }
                          },
                          obscureText: passToogle,
                        ),
                      ),
// Initialisation de notre container pour la case email
                    ],
                  ),
                ),
              ).box.white.roundedSM.make(),
              10.heightBox,
              AppliquerAnimation(
                delay: 3500,
                child: Column(
                  children: [
                    /*Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: (){
                          Get.to(()=>MotDePassOublier());
                        }, child: forgetPassword.text.size(20).make() )),*/
                    10.heightBox,
                    GestureDetector(
                      onTap: () async{
                        if (_formfield.currentState!.validate()) {}
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                          child: button(color: Colors.blue, title: connecter, textColor: white,
                              onPress: () async{
                            controller.isloading(true);
                                await controller.connexionMethod(context: context).then((value){
                                  if(value != null){
                                VxToast.show(context, msg: connexionreussi);
                                Get.offAll(()=>const PagePrincipale());
                                }
                                  if (_formfield.currentState!.validate()) {
                                    setState(() {
                                      email=emailController.text;
                                      password= passwordController.text;
                                    }
                                    );
                                  }
                                }

                                );

                              }).box.width(context.screenWidth-50).make(),

                      ),
                    ),
                  ],
                ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth-70).make(),
              ),
              10.heightBox,
              AppliquerAnimation(delay: 4000,
                child: Container(
                  height: 50,
                  width: 200,
                  child: button(color: Colors.red, title: inscrie, textColor: white, onPress: (){
                    Get.to(()=>Inscription());
                  }).box.width(context.screenWidth-50).make(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
