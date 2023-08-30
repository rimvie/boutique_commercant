import '../../const/const.dart';
import '../../widgets/texfield_client.dart';
import '../../widgets/text_style.dart';



class ParamettreBoutique extends StatelessWidget {
  const ParamettreBoutique({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: boldText(text: paramettreBoutique, size: 16.0),
        actions: [
          TextButton(onPressed: (){}, child: textNormal(text: enregistrer)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClientTextfield(label: nomboutique, hint: "Rimvie freeshop"),
            10.heightBox,
            ClientTextfield(label: adresseBoutique, hint: "avenue Kuwame Kruma"),
            10.heightBox,
            ClientTextfield(label:numeroBoutique , hint: "75342682"),
            20.heightBox,
            ClientTextfield(label:description , hint: descriptionBoutique, isDesc: true),
          ],
        ),
      ),
    );
  }
}
