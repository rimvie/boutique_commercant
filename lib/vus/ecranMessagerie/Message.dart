import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../const/const.dart';
import '../../widgets/text_style.dart';
import 'composant/BulbeMessage.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: darkGrey),
        ),
        title: boldText(text: message, size: 16.0, coleur: fontGrey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: 20,
              itemBuilder: ((context, index){
                return BulbeMessage();
              }),
            ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  Expanded(child: TextFormField(
                    decoration: const InputDecoration(
                      isDense: true,
                      hintText: "Entrer votre message",
                      border: OutlineInputBorder(borderSide: BorderSide(
                        color: purpleColor
                      ))
                    ),
                  )),
                  IconButton(onPressed: (){}, icon: Icon(Icons.send, color: purpleColor)
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
