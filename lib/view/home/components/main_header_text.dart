import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/res/constants.dart';
import 'package:flutter_resource_gallery/res/responsive.dart';
import 'package:flutter_resource_gallery/res/size_helpers.dart';

class MainHeaderText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: buildHeaderText(context, 64, 64, 20, 20),
      tablet: buildHeaderText(context, 64, 64, 20, 20),
      mobile: buildHeaderText(context, 44, 44, 18, 18),
    );
  }

  Widget buildHeaderText(BuildContext context, double titleSize1,
      double titleSize2, double normalSize1, double normalSize2) {
    return SizedBox(
      width: displayWidth(context) * 0.70,
      height: displayHeight(context) * 0.42,
      child: ListView(
        children: [
          RichText(
            text: TextSpan(
              style: titleText(titleSize1, iconColor),
              children: [
                TextSpan(
                  text: 'Cumulated resources ',
                  style: titleText(titleSize1, logoPrimaryColor),
                ),
                TextSpan(
                  text: 'for \nFlutter devs.',
                  style: titleText(titleSize2, logoColor),
                ),
              ],
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: displayHeight(context) * 0.05),
          RichText(
            text: TextSpan(
              style: normalText(normalSize1, iconColor),
              children: [
                TextSpan(
                  style: normalText(normalSize1, textColor),
                  text:
                      'Discover curated and handpicked resources to elevate your Flutter \ndevelopment journey, fostering growth in your skills as a developer and have fun.',
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
