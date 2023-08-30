import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../const/const.dart';
import '../vus/pagePrincipale/pagePrincipale.dart';

class DebutPrincipale extends StatefulWidget {
  const DebutPrincipale({super.key});

  @override
  State<DebutPrincipale> createState() => _DebutPrincipaleState();
}

class _DebutPrincipaleState extends State<DebutPrincipale> {

  changeEcran(){
    Future.delayed(Duration(seconds: 4),(){
      Get.to(()=> PagePrincipale());
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
