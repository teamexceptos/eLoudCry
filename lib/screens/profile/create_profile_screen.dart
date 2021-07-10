import 'package:eloudcry/utils/colors.dart';
import 'package:eloudcry/utils/size_config.dart';
import 'package:eloudcry/widgets/button.dart';
import 'package:eloudcry/widgets/inputfield.dart';
import 'package:eloudcry/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateProfileScreen extends StatefulWidget {
  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  TextEditingController _fullnameTextController;
  TextEditingController _phonenmberTextController;
  TextEditingController _othernameTextController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    _fullnameTextController = TextEditingController();
    _phonenmberTextController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XColors.background(),
      appBar: AppBar(
        backgroundColor: XColors.background(),
        elevation: 0,
      ),
      body: Consumer(builder: (context, watch, _) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: SizeConfig.screenHeightDp - 90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: "Add your contact, and other important details on",
                    style: TextStyle(
                        color: XColors.white(),
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' eLoudCry',
                        style: TextStyle(
                            color: XColors.primaryColor(),
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MkText(
                        "Important Bio",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: XColors.white(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MkUnderlineInputField(
                        controller: _phonenmberTextController,
                        hint: "Your contact",
                        keyboard: TextInputType.number,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MkUnderlineInputField(
                        controller: _fullnameTextController,
                        hint: "Your name",
                        keyboard: TextInputType.text,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MkUnderlineInputField(
                        controller: _othernameTextController,
                        hint: "Your other name",
                        keyboard: TextInputType.text,
                      ),
                      SizedBox(
                        height: 86,
                      ),
                      MkText(
                        "Location Details",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: XColors.white(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MkText(
                        "Current location",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: XColors.textColor().withOpacity(0.3),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MkText(
                        "favourite location",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: XColors.textColor().withOpacity(0.3),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            color: XColors.alphaTextColor(),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          MkText(
                            "your personal details are well protected and can't be shared to anyone except you share to your loved ones.",
                            textAlign: TextAlign.start,
                            textWidth: 330,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: XColors.alphaTextColor(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: MkButton(
                    onPressed: () {},
                    color: XColors.primaryColor(),
                    text: "Create",
                    textColor: Colors.white,
                    isRound: true,
                    width: SizeConfig.screenWidthDp - 30,
                    height: 50,
                  ),
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: "Have your profile already?",
                    style: TextStyle(
                        color: XColors.white(),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Login',
                        style: TextStyle(
                            color: XColors.primaryColor(),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
