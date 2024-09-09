import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paan/Configur/color.dart';
import 'package:paan/Configur/string.dart';
import 'package:paan/Configur/textStyle.dart';
import 'package:paan/Widgets/CommanTextfield.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * .75,
      child: Commantextfield(
        borderRadius: 30,
        picon: const Icon(
          Icons.search,
          color: appColors.dOn7B7B7BColor,
        ),
        text: AppString.search,
        textStyle: interlabelSmallest(mColor: appColors.dOn7B7B7BColor),
      ),
    );
  }
}