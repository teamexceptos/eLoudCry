import 'package:eloudcry/screens/onboarding/onboarding_place_holder.dart';
import 'package:eloudcry/screens/permissions/permission_screen.dart';
import 'package:eloudcry/utils/assets.dart';
import 'package:eloudcry/utils/colors.dart';
import 'package:eloudcry/utils/navigator.dart';
import 'package:eloudcry/utils/size_config.dart';
import 'package:eloudcry/widgets/button.dart';
import 'package:eloudcry/widgets/indicator.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final List<Widget> _pages = <Widget>[
    OnboardingPlaceHolder(
      text: 'Emergency Recording',
      subText: 'Quickly record your emergency message in high-quality audio',
      onboardingImage: MkImageAssets.audioPlay(),
    ),
    OnboardingPlaceHolder(
      text: "Pinpoint Accuracy",
      subText: 'We’ll send your very location to your loved ones in case of an emergency!',
      onboardingImage: MkImageAssets.locationSearch(),
    ),
    OnboardingPlaceHolder(
      text: "Notifications",
      subText: 'We’ll notify your loved ones immediately via text message and notifications on their eLoudCry App in the case of an emergency',
      onboardingImage: MkImageAssets.messagingFeature(),
    ),
    OnboardingPlaceHolder(
      text: "All your loved ones",
      subText: 'Select your closest contacts straight from your phone book and keep updating this list.',
      onboardingImage: MkImageAssets.personalInfo(),
    )
  ];

  final PageController _pageController = PageController(
      keepPage: true,
      initialPage: 0
  );

  ValueNotifier<int> positionValueState = new ValueNotifier(0);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            ValueListenableBuilder(
                valueListenable: positionValueState,
                builder: (context, value, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    SizedBox(height: 90.0),

                    Container(
                      height: 420,
                      child: PageView(
                        children: _pages,
                        controller: _pageController,
                        onPageChanged: onPageChanged,
                      ),
                    ),

                    Indicator(
                        controller: _pageController,
                        itemCount: _pages.length
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        children: <Widget>[

                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: MkButton(
                              onPressed: (){
                                if(positionValueState.value < 3) {
                                  onPageChanged(positionValueState.value + 1);
                                } else {
                                  navigateReplace(context, PermissionScreen());
                                  positionValueState.value = 0;
                                }
                              },
                              color: XColors.primaryColor(),
                              text: value == 3 ? "Continue" : "Next",
                              textColor: Colors.white,
                              isRound: true,
                              width: SizeConfig.screenWidthDp - 30,
                              height: 50,
                            ),
                          ),

                          if(value > 0) ... [

                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: MkOutlinedButton(
                                onPressed: () {

                                },
                                text: value == 3 ? "Login" : "Skip",
                                isRound: true,
                                width: SizeConfig.screenWidthDp - 30,
                                height: 50,
                              ),
                            ),

                          ],

                        ],
                      ),
                    ),

                  ],
                );
              }
            ),
          ],
        ),
      ),
    );
  }

  void onPageChanged(int index) {

    positionValueState.value = index;
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.linearToEaseOut);

  }
}