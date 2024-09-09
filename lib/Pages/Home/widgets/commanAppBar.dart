import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paan/Configur/Images.dart';
import 'package:paan/Configur/color.dart';
import 'package:paan/Configur/string.dart';
import 'package:paan/Configur/textStyle.dart';

class CommanAppBar extends StatelessWidget {
   CommanAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                  const SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset(
                    AssetsImage.locationSvg,
                    width: 15,
                    height: 15,
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}