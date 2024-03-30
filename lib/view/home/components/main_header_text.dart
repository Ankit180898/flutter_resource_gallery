import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/res/constants.dart';
import 'package:flutter_resource_gallery/res/size_helpers.dart';

class MainHeaderText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scaledFontSize = screenWidth / 20; // Adjust based on your preference

    return SizedBox(
      width: displayWidth(context) * 0.70,
      height: displayHeight(context) * 0.40,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                style: titleText(64, iconColor),
                children: [
                  TextSpan(
                      text: 'Cumulated resources ',
                      style: titleText(64, logoPrimaryColor)),
                  TextSpan(
                      text: 'for \nFlutter developers.',
                      style: titleText(64, logoColor)),
                ],
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: displayHeight(context) * 0.05),
            RichText(
              text: TextSpan(
                style: normalText(20, iconColor),
                children: [
                  TextSpan(
                      style: normalText(20, textColor),
                      text:
                          'Discover curated and handpicked resources to elevate your Flutter \ndevelopment journey, fostering growth in your skills as a developer and have fun.'),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
