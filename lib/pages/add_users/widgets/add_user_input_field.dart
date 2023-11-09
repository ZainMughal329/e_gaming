import 'package:e_gamming_matcher/component/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../component/style/text_widget.dart';

class AddUserInputTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obsecure;
  IconData icon;
  TextEditingController contr;
  String descrip;
  String? hint;
  String labelText;
  bool readOnly;

  AddUserInputTextField({
    super.key,
    required this.contr,
    required this.descrip,
    this.textInputAction,
    this.keyboardType,
    this.hint,
    required this.obsecure,
    required this.icon,
    required this.labelText,
    required this.readOnly,

    //
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: TextField(
        controller: contr,
        textInputAction: textInputAction,
        obscureText: obsecure,
        keyboardType: keyboardType,
        readOnly: readOnly,


        style: GoogleFonts.poppins(fontSize: 16),

        decoration: InputDecoration(

          border:UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.iconColor,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.iconColor,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.iconColor,
            ),
          ),

          prefixIcon: Icon(
            icon,
            color: AppColors.iconColor,
          ),
          label: TextWidget(title: labelText, textColor: AppColors.iconColor,),
          hintText: hint,
          hintStyle: GoogleFonts.poppins(fontSize: 16),

        ),),
    );
  }
}
