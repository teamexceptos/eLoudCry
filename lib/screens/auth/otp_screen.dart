import 'package:eloudcry/screens/auth/auth_viewmodel.dart';
import 'package:eloudcry/utils/colors.dart';
import 'package:eloudcry/utils/operation_enum.dart';
import 'package:eloudcry/utils/providers.dart';
import 'package:eloudcry/utils/size_config.dart';
import 'package:eloudcry/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, watch, _) {
        return Column(
          children: [

            Consumer(builder: (context, watch, _) {

              AuthModel authModel = watch(authProvider.state);
              bool isLoading = authModel.ops == OperationStatus.LOADING;

              return Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    SizedBox(height: 126),

                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: "Enter OTP sent to your phone number to gain access to your profile",
                        style: TextStyle(
                            color: XColors.white(),
                            fontSize: 26,
                            fontFamily: "Comfortaa",
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    SizedBox(height: 55),

                    Container(
                      child: OTPTextField(
                        length: 6,
                        width: SizeConfig.screenWidthDp,
                        keyboardType: TextInputType.number,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldWidth: 35,
                        fieldStyle: FieldStyle.underline,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20),
                        onChanged: (pin) {
                        },
                        onCompleted: (pin) {

                        },
                      ),
                    ),

                    SizedBox(height: 55),

                    MkButton(
                      isLoading: isLoading,
                      onPressed: !isLoading ? () {

                      } : () {},
                      text: 'Continue',
                      height: 56,
                      textColor: Colors.white,
                      progressColor: Colors.white,
                      isRound: true,
                      width: 400,
                    ),
                  ],
                ),
              );

            }),

            SizedBox(height: 20.0),

            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: "Didn't get any?",
                style: TextStyle(
                    color: XColors.white(),
                    fontSize: 16,
                    fontFamily: "Comfortaa",
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Resend',
                    style: TextStyle(
                        color: XColors.primaryColor(),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

          ],
        );
      }),
    );
  }
}
