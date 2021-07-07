import 'package:eloudcry/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Consumer(builder: (context, watch, _) {

          return Stack(
            children: [
              Container(
                child: MkImageAssets.splash_icon(),
              ),
            ],
          );
        }
      ),
    );
  }
}
