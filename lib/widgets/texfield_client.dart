import 'package:boutique_commercant/const/colors.dart';
import 'package:boutique_commercant/const/const.dart';
import 'package:boutique_commercant/widgets/text_style.dart';

Widget ClientTextfield({label, hint, controller, isDesc= false}){
  return TextFormField(
    maxLines: isDesc ? 4: 1,
    decoration: InputDecoration(
      label: textNormal(text: label),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: white,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: white
        ),
      ),
      hintText: hint,
      hintStyle: TextStyle(color: white),
    ),

  );
}