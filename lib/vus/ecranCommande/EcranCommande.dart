import '../../const/const.dart';
import '../../const/images.dart';
import '../../widgets/appbarWidget.dart';
import '../../widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;

class EcranCommande extends StatelessWidget {
  const EcranCommande({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appbarWidget(commande),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(20, (index) => ListTile(
              onTap: (){},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular( 12),
              ),
              tileColor: textfieldGrey,
              title: boldText(text: "987654345", coleur: red),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: fontGrey),
                      10.widthBox,
                      textNormal(text: intl.DateFormat().add_yMd().format(DateTime.now()), coleur: fontGrey),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.payment, color: fontGrey),
                      10.widthBox,
                      boldText(text: nonPaye, coleur: red),
                    ],
                  )
                ],
              ),
              trailing: boldText(text: "40000", coleur: purpleColor, size: 16.0),
            ).box.margin(const EdgeInsets.only(bottom: 4)).make(),
            ),
          ),
        ),
      ),
    );
  }
}
