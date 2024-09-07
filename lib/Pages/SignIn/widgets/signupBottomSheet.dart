import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paan/Configur/color.dart';
import 'package:paan/Configur/string.dart';
import 'package:paan/Configur/textStyle.dart';
import 'package:paan/Pages/SignIn/widgets/signUp.dart';
import 'package:paan/Widgets/CommanTextfield.dart';

class SignUpBottemsheet extends StatelessWidget {
  const SignUpBottemsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
          color: appColors.dOnBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              AppString.signup,
              style: bodyMedium(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
            child: Commantextfield(
              text: AppString.enterAadhaarNumber,
              textStyle: labelSmall(mColor: appColors.fPrimaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
            child: Commantextfield(
              text: AppString.registerNumber,
              textStyle: labelSmall(mColor: appColors.fPrimaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
            child: Commantextfield(
              icon: const Icon(Icons.password),
              // svgPicture: SvgPicture.asset(
              //   AssetsImage.noEyeSvg,

              // ),
              text: AppString.createpassword,
              textStyle: labelSmall(mColor: appColors.fPrimaryColor),
            ),
          ),
         const SizedBox(height: 130,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    AppString.alreadyhaveanaccount,
                    style:
                      labelMedium(mColor: appColors.dPrimaryColor),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: InkWell(
                  onTap: () {
                    // Get.to(Signup());
                  },
                  child: Text(
                    AppString.signin,
                    style:
                        labelMedium(mColor: appColors.dOnDarkBackgroundColor),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}