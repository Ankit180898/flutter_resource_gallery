import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/res/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double borderRadius;
  final double height;
  final double width;
  final double textSize;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.height,
    required this.width,
    required this.textSize,
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: salutationTextStyle(textSize, iconColor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
