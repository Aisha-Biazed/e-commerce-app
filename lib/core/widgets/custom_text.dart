import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.txt,
      this.fontSize = 18,
      this.txtColor,
      this.fontWeight,
      this.textAlign,
      this.height})
      : super(key: key);
  final String txt;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? txtColor;
  final TextAlign? textAlign;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Text(txt,
        textAlign: textAlign,
        maxLines: 10,
        softWrap: true,
        style: TextStyle(
          height: height,
          fontSize: fontSize!,
          fontWeight: fontWeight,
          fontFamily: 'Poppins',
          color: txtColor,
          overflow: TextOverflow.ellipsis,
        ));
  }
}
