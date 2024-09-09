import 'package:flutter/material.dart';
import 'package:paan/Configur/color.dart';
import 'package:paan/Configur/string.dart';
import 'package:paan/Configur/textStyle.dart';

class Benner extends StatelessWidget {
  const Benner({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
            margin:const EdgeInsets.only(left: 20, right: 50),
            decoration: BoxDecoration(
              color: appColors.dOnB5A386Color,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
               const SizedBox(height: 10,),
                Center(
                  child: Text(
                    AppString.goodeveningPiyush,
                    style: bodySmallest(mFontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 10,),
              ],
            ),
          )
        ;
  }
}