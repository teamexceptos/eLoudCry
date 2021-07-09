import 'package:eloudcry/services/persmission.dart';
import 'package:eloudcry/utils/colors.dart';
import 'package:eloudcry/utils/providers.dart';
import 'package:eloudcry/utils/size_config.dart';
import 'package:eloudcry/views/view_model/permission_viewmodel.dart';
import 'package:eloudcry/widgets/button.dart';
import 'package:eloudcry/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionScreen extends StatefulWidget {
  @override
  _PermissionScreenState createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  @override
  void initState() {

    PermissionService.requestPermission(Permission.contacts).then((value) {
      context.read(permissionProvider).setContacts(value);
    });

    PermissionService.requestPermission(Permission.microphone).then((value) {
      context.read(permissionProvider).setRecordings(value);
    });

    PermissionService.requestPermission(Permission.location).then((value) {
      context.read(permissionProvider).setLocation(value);
    });

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

        PermissionsModel permissionsModel = watch(permissionProvider.state);
        bool isAllSet = context.read(permissionProvider).isAllPermissionSet();

        return SingleChildScrollView(child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            child: Column(
              children: [

                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: "Make",
                    style:TextStyle(color: XColors.white(), fontSize: 26, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                  TextSpan(text: ' eLoudCry',
                    style: TextStyle(color: XColors.primaryColor(), fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: ' be your emergency by accepting needed permissions',
                      style: TextStyle(color: XColors.white(), fontSize: 26, fontWeight: FontWeight.bold),)
                      ],
                  ),
                ),

                SizedBox(height: 126,),

                Column(
                  children: [

                    InkWell(
                      onTap: () async {
                        await PermissionService.requestPermission(Permission.microphone).then((value) {
                          context.read(permissionProvider).setRecordings(value);
                        });
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MkText("Recordings",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w800,
                              color: permissionsModel.setRecordings ? XColors.primaryColor() : XColors.white().withOpacity(0.4),
                            ),
                          ),

                          Icon(Icons.mic, color: permissionsModel.setRecordings ? XColors.primaryColor() : XColors.white().withOpacity(0.4),),
                        ],
                      ),
                    ),

                    SizedBox(height: 21,),

                    InkWell(
                      onTap: () async {
                        await PermissionService.requestPermission(Permission.location).then((value) {
                          context.read(permissionProvider).setLocation(value);
                        });
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MkText("Location",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w800,
                              color: permissionsModel.setLocation ? XColors.primaryColor() : XColors.white().withOpacity(0.4),
                            ),
                          ),

                          Icon(Icons.location_on_rounded, color: permissionsModel.setLocation ? XColors.primaryColor() : XColors.white().withOpacity(0.4),),
                        ],
                      ),
                    ),

                    SizedBox(height: 21,),

                    InkWell(
                      onTap: () async {
                        bool isSet = await PermissionService.requestPermission(Permission.contacts);
                        context.read(permissionProvider).setContacts(isSet);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MkText("Contacts/SMS",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w800,
                              color: permissionsModel.setContacts ? XColors.primaryColor() : XColors.white().withOpacity(0.4),
                            ),
                          ),

                          Icon(Icons.message, color: permissionsModel.setContacts  ? XColors.primaryColor() : XColors.white().withOpacity(0.4),),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 146,),

                Column(
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: MkButton(
                        onPressed: isAllSet ? () => print("All set") : () {},
                        color: XColors.primaryColor(),
                        text: "Done",
                        textColor: Colors.white,
                        isRound: true,
                        width: SizeConfig.screenWidthDp - 30,
                        height: 50,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: MkOutlinedButton(
                        onPressed: () {

                        },
                        text: "Login",
                        isRound: true,
                        width: SizeConfig.screenWidthDp - 30,
                        height: 50,
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),
        ));
      }),
    );
  }
}
