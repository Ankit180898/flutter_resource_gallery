import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/res/constants.dart';
import 'package:flutter_resource_gallery/res/size_helpers.dart';

class MainHeaderText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scaledFontSize = screenWidth / 20; // Adjust based on your preference

    return SizedBox(
      width: displayWidth(context)*0.70,
      height: displayHeight(context)*0.40,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                style: titleText(72, iconColor),
                children: [
                  TextSpan(
                    text: 'Assorted resources ',
                    style: titleText(72,textColor)
                  ),
                  TextSpan(
                    text: 'for \nfrontend developers and \nweb designers.',
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: displayHeight(context)*0.05),
            RichText(
              text: TextSpan(
                style: normalText(24, iconColor),
                children: [
                  TextSpan(
                    text:
                        'Explore curated and handpicked goodies that enhance your \nworkflow and cultivate your growth as a developer and designer.',
                  ),
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
