import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_resource_gallery/res/constants.dart';
import 'package:flutter_resource_gallery/res/responsive.dart';
import 'package:flutter_resource_gallery/res/size_helpers.dart';

class MainHeaderText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Responsive(
      desktop: SizedBox(
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
      ),
      tablet: SizedBox(
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
      ),
      mobile: SizedBox(
        width: displayWidth(context) * 0.75,
        height: displayHeight(context) * 0.40,
        child: Column(
      
          children: [
            RichText(
              text: TextSpan(
                style: titleText(44, iconColor),
                children: [
                  TextSpan(
                      text: 'Cumulated resources ',
                      style: titleText(44, logoPrimaryColor)),
                  TextSpan(
                      text: 'for \nFlutter devs.',
                      style: titleText(44, logoColor)),
                ],
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
            SizedBox(height: displayHeight(context) * 0.05),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: RichText(
                text: TextSpan(
                  style: normalText(18, iconColor),
                  children: [
                    TextSpan(
                        style: normalText(18, textColor),
                        text:
                            'Discover curated and handpicked resources in \nFlutter development journey, fostering growth in \nyour skills as a developer and have fun.'),
                  ],
                ),
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
