import 'package:flutter/material.dart';
import 'package:paan/Configur/color.dart';
import 'package:paan/Configur/string.dart';
import 'package:paan/Configur/textStyle.dart';

class CommanTextButton extends StatelessWidget {
  final double? Height;
  final double? pedding;
  final double? borderRadius;
  final String text;
  final Color? borderColor;
  final Color? buttonColor;
  final TextStyle? textStyle;
  final VoidCallback? ontap;
  const CommanTextButton(
      {super.key,
      this.Height,
      this.pedding,
      this.borderRadius,
      required this.text,
      this.borderColor,
      this.buttonColor,
      this.textStyle,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: Height?? 55,
        margin: EdgeInsets.symmetric(horizontal: pedding?? 10),
        decoration: BoxDecoration(
            color: buttonColor,
            border: Border.all(color: borderColor ?? appColors.tBorderColor),
            borderRadius: BorderRadius.circular(
            borderRadius ?? 15,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
