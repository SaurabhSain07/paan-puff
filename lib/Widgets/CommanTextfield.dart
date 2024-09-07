import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paan/Configur/color.dart';

class Commantextfield extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final Icon? icon;
  final SvgPicture? svgPicture;
  final TextEditingController? controller;
  const Commantextfield(
      {super.key, this.text, this.textStyle, this.icon, this.controller, this.svgPicture});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: textStyle,
      decoration: InputDecoration(
          hintText: text,
          hintStyle: textStyle,
          suffixIcon: svgPicture??icon,
          border: OutlineInputBorder(
            borderSide:const BorderSide(color: appColors.tBorderColor),
              borderRadius: BorderRadius.circular(20))),
    );
  }
}