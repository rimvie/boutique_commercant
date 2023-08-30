import 'package:boutique_commercant/Controller/homeController.dart';
import 'package:boutique_commercant/const/images.dart';
import 'package:boutique_commercant/vus/ecranCommande/EcranCommande.dart';
import 'package:boutique_commercant/vus/ecranProduit/EcranProduit.dart';
import 'package:boutique_commercant/vus/pagePrincipale/ecranPrincipale.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../const/const.dart';
import '../ecranProfile/EcranProfile.dart';

class PagePrincipale extends StatelessWidget {
  const PagePrincipale({super.key});

  @override
  Widget build(BuildContext context) {

    var controller= Get.put(HomeController());

    var navScreen=[const EcranPrincipale(), const EcranProduit(), const EcranCommande(), const EcranProfile()];

    var bottomNavbar= [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: bord),
      BottomNavigationBarItem(icon: Image.asset(icProduit, width: 24, color: Colors.blue), label: produits),
      BottomNavigationBarItem(icon: Image.asset(icCommande, width: 24, color: Colors.blue,), label: commande),
      BottomNavigationBarItem(icon: Image.asset(icGeneraleSetting, width: 24, color: Colors.blue), label: parametre),
    ];

    return Scaffold(
      bottomNavigationBar: Obx(()=> BottomNavigationBar(
          onTap: (index){
            controller.navIndex.value= index;
          },
          currentIndex: controller.navIndex.value,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: purpleColor,
            unselectedItemColor: Colors.blue,
            items: bottomNavbar),
      ),
      body: Obx(()=> Column(
          children: [
            Expanded(child: navScreen.elementAt(controller.navIndex.value)),
          ],
        ),
      ),
    );
  }
}
