import 'package:flutter/material.dart';
import 'package:paan/Configur/Images.dart';
import 'package:paan/Configur/color.dart';
import 'package:paan/Configur/string.dart';
import 'package:paan/Configur/textStyle.dart';
import 'package:paan/Pages/Home/widgets/catagrories.dart';

class Catagroriescontaner extends StatelessWidget {
  const Catagroriescontaner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  AppString.exploreCategories,
                  style: headingSmall(mFontWeight: FontWeight.w500),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.more_horiz_rounded,
                size: 50,
              )
            ],
          ),
         const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CatagroriesItem(
                image: AssetImage(AssetsImage.cigratessImage),
                Height: 10,
                text: AppString.cigarettes,
              ),
              
               CatagroriesItem(
                image: AssetImage(AssetsImage.smokingImage),
                Height: 5,
                text: AppString.smokingAccessories,
              ),

               CatagroriesItem(
                image: AssetImage(AssetsImage.enrgyDrinkImage),
                Height: 5,
                text: AppString.energyDrinks,
              ),

               CatagroriesItem(
                image: AssetImage(AssetsImage.freserImage),
                Height: 10,
                text: AppString.freshners,
              ),
            ],
          )
        ],
      ),
    );
  }
}