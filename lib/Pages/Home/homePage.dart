import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paan/Configur/Images.dart';
import 'package:paan/Configur/color.dart';
import 'package:paan/Configur/string.dart';
import 'package:paan/Configur/textStyle.dart';
import 'package:paan/Pages/Home/widgets/benner.dart';
import 'package:paan/Pages/Home/widgets/homeSearch.dart';
import 'package:paan/Widgets/CommanTextfield.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Text(
                  AppString.yourLocation,
                  style: interlabelSmall(
                      mFontWeight: FontWeight.w600,
                      mColor: appColors.dOn7B7B7BColor),
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    Text(
                      AppString.locationyour,
                      style: interlabelSmall(
                          mFontWeight: FontWeight.w400,
                          mColor: appColors.dOn7B7B7BColor),
                    ),
                   const SizedBox(width: 5,),
                    SvgPicture.asset(AssetsImage.locationSvg, width: 15, height: 15,)
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const Benner(),
         Padding(
           padding: const EdgeInsets.only(top: 10, left: 20),
           child: Text(AppString.grabyour, style: labelLargest(),),
         ),
         Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                  AppString.favourite,
                  style: bodyMedium(mFontWeight: FontWeight.w600),
                ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                  AppString.cigarettes,
                  style: interlabelLargest(mColor: appColors.dPrimaryColor),
                ),
            ),
          ],
         ),
        const Padding(
           padding: EdgeInsets.only(left: 20),
           child: HomeSearch(),
         )
        ],
      ),
    );
  }
}