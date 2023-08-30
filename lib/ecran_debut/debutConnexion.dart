import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../const/const.dart';
import '../vus/Authentification/connexion.dart';

class DebutConnexion extends StatefulWidget {
  const DebutConnexion({super.key});

  @override
  State<DebutConnexion> createState() => _DebutConnexionState();
}

class _DebutConnexionState extends State<DebutConnexion> {

  changeEcran(){
    Future.delayed(Duration(seconds: 4),(){
      Get.to(()=> Connexion());
    });
  }

  @override
  void initState(){
    changeEcran();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Center(
            child: Lottie.asset("assets/animations/1.json"),
          ),
        )
    );
  }
}
