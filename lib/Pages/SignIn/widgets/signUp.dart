import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paan/Configur/Images.dart';
import 'package:paan/Configur/color.dart';
import 'package:paan/Configur/string.dart';
import 'package:paan/Configur/textStyle.dart';
import 'package:paan/Pages/OTP/otpPage.dart';
import 'package:paan/Pages/SignIn/widgets/signupBottomSheet.dart';
import 'package:paan/Pages/SignIn/widgets/singInBottemSheet.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

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
                                        Image.asset(AssetsImage.aboveCircleImage, width: 160,),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 100),
                                          child: Image.asset(AssetsImage.cloudShedowImage, width: 100,),
                                        )
                                      ], 
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: SizedBox(
                                        width: 200,
                                          child: Text(
                                        AppString.letsStart,
                                        style: bodyLarge(mColor: appColors.dOnBackgroundColor),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 150,
                                child: Image.asset(AssetsImage.bg1Image, width: Get.width*.9,),
                                ),
                            ],
                          ),
                        ),
                        
                       const Positioned(
                          bottom: 0,
                          child: SignUpBottemsheet(),
                        ),

                        Positioned(
                          right: 20,
                          top: 230,
                          child: InkWell(
                            onTap: (){
                              Get.to(Otppage());
                            },
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