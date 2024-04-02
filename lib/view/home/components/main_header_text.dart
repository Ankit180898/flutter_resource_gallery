import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/res/constants.dart';
import 'package:flutter_resource_gallery/res/responsive.dart';
import 'package:flutter_resource_gallery/res/size_helpers.dart';

class MainHeaderText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: buildHeaderText(
        context,
        titleSize1: 72,
        titleSize2: 72,
        normalSize1: 20,
        normalSize2: 20,
      ),
      tablet: buildHeaderText(
        context,
        titleSize1: 54,
        titleSize2: 54,
        normalSize1: 20,
        normalSize2: 20,
      ),
      mobile: buildHeaderText(
        context,
        titleSize1: 46,
        titleSize2: 46,
        normalSize1: 14,
        normalSize2: 14,
      ),
    );
  }

  Widget buildHeaderText(
    BuildContext context, {
    required double titleSize1,
    required double titleSize2,
    required double normalSize1,
    required double normalSize2,
  }) {
    return SizedBox(
      width: displayWidth(context) * 0.70,
      height: displayHeight(context) * 0.45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
           
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: titleSize1,
                  color: iconColor,
                ),
                children: [
                  TextSpan(
                    text: 'Cumulated resources ',
                    style: titleText(
                      titleSize1,
                      logoPrimaryColor,
                    ),
                  ),
                  TextSpan(
                    text: 'for ',
                    style: titleText(
                      titleSize2,
                      logoColor,
                    ),
                  ),
                  TextSpan(
                    text: 'Flutter devs.',
                    style: titleText(
                      titleSize1,
                      logoColor,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 10,),
          Flexible(
            flex: 1,
            child: Text(
              "Explore curated resources to enhance your Flutter skills and enjoy your development journey!",
              style: normalText(
                normalSize1,
                textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
