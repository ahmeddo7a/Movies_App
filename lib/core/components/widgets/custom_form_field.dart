import 'package:flutter/material.dart';

import '../constants/color_manager.dart';
import '../constants/font_manager.dart';
import '../constants/size_manager.dart';

enum CustomFieldType {custom}
class CustomFormField extends StatelessWidget {

  final Function? onSubmit;
  final Function(String)? onChange;
  final Function? onTap;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function()? suffixPressed;
  final CustomFieldType customFieldType;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final String label;
  final Color myCursorColor;
  final double myBorderRadius;
  final Color textColor;
  final bool isPassword;
  final String myFontFamily;
  final FontWeight myFontWeight;
  final TextInputType? myInputType;

  const CustomFormField(
      {
        Key? key,
        required this.customFieldType,
        this.controller,
        required this.label,
        this.prefixIcon,
        this.onSubmit,
        this.onChange,
        this.onTap,
        this.suffixIcon,
        this.suffixPressed,
        this.validate,
        required this.myInputType,
        this.myCursorColor= ColorManager.blackSemi,
        this.myBorderRadius= SizeManager.bigRadius,
        this.textColor= ColorManager.blackSemi,
        this.isPassword = false,
        this.myFontFamily = FontConstants.txtFontFamily,
        this.myFontWeight = FontWeightManager.medium,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextInputType? type;
    String? formFieldLabel;
    //IconData? customPrefix;
    switch(customFieldType){
      case CustomFieldType.custom:
        formFieldLabel=label;
        type=myInputType;
        break;
    }
    return TextFormField(
        validator: validate,
        controller: controller,
        cursorColor: myCursorColor,
        onChanged: onChange,
        keyboardType: type,
        obscureText: isPassword,
        style:  TextStyle(
            color: textColor,
            fontWeight: myFontWeight
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorManager.white,
          enabledBorder: OutlineInputBorder(
            borderSide:  BorderSide(width: SizeManager.borderSide, color: myCursorColor),
            borderRadius: BorderRadius.circular(myBorderRadius),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide:  BorderSide(width: SizeManager.borderSide, color: myCursorColor),
              borderRadius: BorderRadius.circular(myBorderRadius),
              gapPadding: SizeManager.borderSide
          ),
          hintText: formFieldLabel,
          hintStyle: const TextStyle(color: ColorManager.grey),
          //labelText: formFieldLabel,
          //labelStyle:  const TextStyle(color: ColorManager.grey),
          //prefixIcon: Icon(customPrefix,color: myCursorColor,),
          suffixIcon: IconButton(icon: Icon(suffixIcon,color: myCursorColor,),
            onPressed: suffixPressed,
          ),
        )
    );
  }
}