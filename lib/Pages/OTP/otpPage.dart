import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paan/Configur/Images.dart';
import 'package:paan/Configur/color.dart';
import 'package:paan/Configur/string.dart';
import 'package:paan/Configur/textStyle.dart';
import 'package:paan/Controller/Authcontroller.dart';
import 'package:paan/Pages/OTP/widgets/bottomSheet.dart';
import 'package:paan/Pages/SignIn/widgets/signupBottomSheet.dart';
import 'package:paan/Pages/SignIn/widgets/singInBottemSheet.dart';

class Otppage extends StatelessWidget {
  const Otppage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController=Get.put(AuthController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration:const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
              appColors.dPrimaryColor,
              appColors.lPrimaryColor
            ])
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: Get.width,
                      child: Column(
                        children: [
                          Center(
                            child: Obx(()=> authController.isfullfill.value==true
                            ? Container(
                              margin:const EdgeInsets.only(top: 30),
                              width: 300,
                              height: 300,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                    width: 230,
                                    child: Text(AppString.codeReceived,
                                    textAlign: TextAlign.center,
                                    style: headingSmall(),
                                    )
                                    ),
                                ),
                              ),
                              decoration:const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(AssetsImage.leftWellImage)),
                              ),
                            ):Container(
                              margin:const EdgeInsets.only(top: 30),
                              width: 300,
                              height: 300,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                    width: 230,
                                    child: Text(AppString.registeredmobilenumber,
                                    textAlign: TextAlign.center,
                                    style: labelLarge(),
                                    )
                                    ),
                                ),
                              ),
                              decoration:const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(AssetsImage.well1Image)),
                              ),
                            )
                          ),
                          ),
                         const OTPBottemsheet()
                        ],
                      ),
                    ),

                    Obx(()=>authController.isfullfill.value==false
                    ? Positioned(
                      top: 270,
                      right: 20,
                      child: SvgPicture.asset(AssetsImage.backCirleButtonSvg)
                      )
                    :const SizedBox())
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}