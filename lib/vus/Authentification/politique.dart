import 'package:boutique_commercant/const/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const/styles.dart';

class PolitiqueConfidentialite extends StatelessWidget {
  const PolitiqueConfidentialite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: "Politique de confidentialité"
            .text
            .color(darkGrey)
            .fontFamily(semibold)
            .make(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                  "La confidentialité de vos données personnelles est une priorité absolue pour nous. Cette politique de confidentialité vise à vous informer sur la manière dont nous collectons, utilisons, partageons et protégeons vos informations lorsque vous utilisez notre application mobile de e-commerce. Veuillez lire attentivement cette politique pour comprendre nos pratiques en matière de confidentialité et comment nous traitons vos données personnelles.", style: TextStyle(fontSize: 19)),
              5.heightBox,
              Text("1. Collecte des informations",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black, fontSize: 19)),
              5.heightBox,
              Text(
                  "1.1 Informations fournies par l'utilisateur : Lorsque vous utilisez notre application mobile de e-commerce, vous pouvez choisir de nous fournir certaines informations personnelles telles que votre nom, votre adresse e-mail, votre adresse de livraison, vos préférences de paiement, etc. Ces informations sont collectées lorsque vous vous inscrivez, passez une commande, remplissez des formulaires ou communiquez avec notre service client.", style: TextStyle(fontSize: 19)),
              5.heightBox,
              Text(
                  "1.2 Informations collectées automatiquement : Nous collectons également certaines informations automatiquement lorsque vous utilisez notre application mobile. Cela peut inclure votre adresse IP, votre type de navigateur, votre système d'exploitation, des informations sur votre appareil mobile, votre activité de navigation, les produits que vous consultez ou achetez, etc. Ces informations sont collectées à l'aide de technologies telles que les cookies, les balises Web et les journaux de serveur.", style: TextStyle(fontSize: 19)),
              7.heightBox,
              Text("2. Utilisation des informations", style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 19)),
              5.heightBox,
              Text("Nous utilisons les informations collectées pour les finalités suivantes :", style: TextStyle(fontSize: 19),),

              10.heightBox,
              Text("2.1 Fournir et personnaliser nos services : Nous utilisons vos informations pour vous fournir les produits et services que vous demandez. Cela inclut le traitement de vos commandes, la livraison des produits, la gestion de votre compte, la personnalisation de votre expérience utilisateur, etc.", style: TextStyle(fontSize: 19),),

              5.heightBox,
              Text("2.2 Communication et assistance client : Nous utilisons vos informations pour communiquer avec vous concernant vos commandes, répondre à vos demandes, vous fournir un support technique et vous informer sur les mises à jour importantes ou les offres promotionnelles.", style: TextStyle(fontSize: 19)),

              5.heightBox,
              Text("2.3 Amélioration de notre application mobile : Nous utilisons les informations collectées pour comprendre comment nos utilisateurs interagissent avec notre application mobile, analyser les tendances, effectuer des études de marché et améliorer constamment nos produits et services.", style: TextStyle(fontSize: 19)),

              5.heightBox,
              Text("2.4 Marketing et publicité : Sous réserve de votre consentement, nous pouvons utiliser vos informations pour vous envoyer des informations marketing, des newsletters, des offres spéciales ou des publicités ciblées susceptibles de vous intéresser.", style: TextStyle(fontSize: 19)),

              7.heightBox,
              Text("Sécurité des informations", style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 19)),

              5.heightBox,

              Text("Nous mettons en œuvre des mesures de sécurité appropriées pour protéger vos informations personnelles contre tout accès non autorisé, toute modification, toute divulgation ou toute destruction. Cependant, veuillez noter qu'aucune méthode de transmission sur Internet ou de stockage électronique n'est totalement sécurisée, et nous ne pouvons garantir la sécurité absolue de vos informations.", style: TextStyle(fontSize: 19)),

              7.heightBox,

              Text('Vos choix et droits',style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 19) ),

              7.heightBox,

              Text("Vous avez le droit de contrôler et de gérer les informations que vous nous fournissez. Vous pouvez accéder, modifier, mettre à jour ou supprimer vos informations personnelles en vous connectant à votre compte ou en nous contactant directement. Vous pouvez également choisir de ne pas recevoir de communications marketing de notre part en ajustant les paramètres de notification dans l'application ou en vous désabonnant de nos newsletters.", style: TextStyle(fontSize: 19)),

              7.heightBox,

              Text("Modifications de la politique" ,style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 19) ),

              7.heightBox,

              Text("Nous nous réservons le droit de modifier cette politique de confidentialité à tout moment. Toute modification sera publiée sur notre application mobile avec une date d'entrée en vigueur mise à jour. Nous vous encourageons à consulter régulièrement cette politique de confidentialité pour vous tenir informé des pratiques de confidentialité en vigueur.", style: TextStyle(fontSize: 19)),

              7.heightBox,

              Text("Nous contacter",style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 19) ),

              7.heightBox,

              Text("Si vous avez des questions, des préoccupations ou des demandes concernant cette politique de confidentialité ou notre traitement de vos informations personnelles, veuillez nous contacter au +226 73988212                                                              mail: boutiqueapp@gmail.com", style: TextStyle(fontSize: 19))
            ],
          ),
        ),
      ),
    );
  }
}
