import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paan/Configur/Images.dart';
import 'package:paan/Configur/color.dart';
import 'package:paan/Configur/string.dart';
import 'package:paan/Configur/textStyle.dart';
import 'package:paan/Pages/SignIn/widgets/singInBottemSheet.dart';
import 'package:paan/Widgets/CommanTextfield.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: appColors.dPrimaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration:const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                    appColors.dPrimaryColor,
                    appColors.lPrimaryColor
                  ])
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          child: Stack(
                            children: [
                              Container(
                                height: Get.height,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(AssetsImage.circleImage, width: 160,),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 40),
                                          child: Image.asset(AssetsImage.cloudRightImage, width: 180,),
                                        )
                                      ], 
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: SizedBox(
                                        width: 200,
                                          child: Text(
                                        AppString.welcomeBack,
                                        style: bodyLarge(mColor: appColors.dOnBackgroundColor),
                                      )),
                                    ),
                                    Image.asset(AssetsImage.cloudLeftImage, width: 110,),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 300,
                                child: Image.asset(AssetsImage.bg1Image, width: Get.width*.9,)),
                            ],
                          ),
                        ),
                        
                       const Positioned(
                          bottom: 0,
                          child: SignInBottemsheet(),
                        ),

                        Positioned(
                          right: 20,
                          top: 430,
                          child: InkWell(
                            onTap: (){},
                            child: SvgPicture.asset(AssetsImage.cirleButtonSvg),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}