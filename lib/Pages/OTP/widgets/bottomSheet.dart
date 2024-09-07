import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paan/Configur/color.dart';
import 'package:paan/Configur/string.dart';
import 'package:paan/Configur/textStyle.dart';
import 'package:paan/Controller/Authcontroller.dart';
import 'package:paan/Pages/Map/map.dart';

class OTPBottemsheet extends StatelessWidget {
  const OTPBottemsheet({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController=Get.put(AuthController());
    
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
          color: appColors.dOnBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              AppString.codeVerification,
              style: bodyMedium(),
            ),
          ),
           SizedBox(height: Get.height*.42,
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(AppString.enterverificationcodehere, style: labelSmall(),),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * .08),
                child: SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        4,
                        (Index) => SizedBox(
                              width: 65,
                              child: TextField(
                                onChanged: (value)async {
                                  if (value.length == 1 && Index <= 3) {
                                    FocusScope.of(context).nextFocus();
                                    authController.isfullfill.value = true;
                                  } else if (value.isEmpty && Index > 0) {
                                    FocusScope.of(context).previousFocus();
                                  }

                                  bool allFilled = authController.otpController
                                      .every((controller) =>
                                          controller.text.isNotEmpty);
                                  if (allFilled) {
                                    authController.isfullfill.value = true;
                                    await Get.to(MapPage());
                                  } else {
                                    authController.isfullfill.value = false;
                                  }
                                },
                                keyboardType: TextInputType.number,
                                style: bodySmall(),
                                controller: authController.otpController[Index],
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: appColors.otpBorderColor),),),
                              ),
                            )),
                  ),
                ),
              ),
             
             const SizedBox(height: 150,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width*.09),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          
                        },
                        child: Text(
                          AppString.didntreceivedthecodeyet,
                          style: labelMedium(mColor: appColors.dPrimaryColor),
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          
                        },
                        child: Text(
                          AppString.resend,
                          style: labelMedium(),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
           ),
          ),
        ]
      ),
    );
  }
}