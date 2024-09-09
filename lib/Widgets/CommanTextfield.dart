import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paan/Configur/color.dart';

class Commantextfield extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final Icon? icon;
  final SvgPicture? svgPicture;
  final Icon? picon;
  final SvgPicture? psvgPicture;
  final TextEditingController? controller;
  final double? borderRadius;
  const Commantextfield(
      {super.key,
      this.text,
      this.textStyle,
      this.icon,
      this.controller,
      this.svgPicture,
      this.picon,
      this.psvgPicture, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius?? 20),
        border: Border.all(color: appColors.tBorderColor)
      ),
      child: TextField(
        controller: controller,
        style: textStyle,
        // maxLines: 2,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: textStyle,
            prefixIcon: psvgPicture??picon,
            suffixIcon: svgPicture??icon,
            border: InputBorder.none,
            contentPadding:const EdgeInsets.all(25)
            ),
      ),
    );
  }
}