import 'package:flutter/material.dart';
import 'package:paan/Configur/Images.dart';
import 'package:paan/Configur/color.dart';
import 'package:paan/Configur/string.dart';
import 'package:paan/Configur/textStyle.dart';

class CatagroriesItem extends StatelessWidget {
  final AssetImage? image;
  final String? text;
  final double? Height;
  const CatagroriesItem({super.key, this.image, this.text, this.Height, });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50)),
          border: Border.all(width: 1)),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
           CircleAvatar(
            radius: 31,
            backgroundColor: appColors.dPrimaryColor,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: image,
            ),
          ),
           SizedBox(
            height: Height,
          ),
          Text(
            text?? '',
            style: labelSmallest(mFontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}