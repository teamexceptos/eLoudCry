import 'package:eloudcry/utils/colors.dart';
import 'package:eloudcry/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingPlaceHolder extends StatelessWidget {
  const OnboardingPlaceHolder({
    @required this.text,
    this.subText,
    @required this.onboardingImage,
  });

  final String text;
  final String subText;
  final SvgPicture onboardingImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Container(height: 180, width: 150, child: onboardingImage),
            SizedBox(height: 25),
            MkText(text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  color: XColors.white(),
                ),
            ),
            SizedBox(height: 15),
            Container(
              child: MkText(subText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                    color: XColors.primaryColor(),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
