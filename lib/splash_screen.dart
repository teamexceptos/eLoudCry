import 'dart:async';

import 'package:eloudcry/screens/onboarding/onboarding_screen.dart';
import 'package:eloudcry/utils/assets.dart';
import 'package:eloudcry/utils/colors.dart';
import 'package:eloudcry/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Timer(Duration(seconds: 4), () {
      navigateReplace(context, OnboardingScreen());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Consumer(builder: (context, watch, _) {

          return Stack(
            children: [
              Container(
                color: XColors.mainColor(),
                child: Center(child: MkImageAssets.splashIcon()),
              ),
            ],
          );
        }
      ),
    );
  }
}
