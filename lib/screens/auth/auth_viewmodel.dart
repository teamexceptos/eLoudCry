import 'package:eloudcry/models/profile/profile_model.dart';
import 'package:eloudcry/services/local_data.dart';
import 'package:eloudcry/utils/operation_enum.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthViewModel extends StateNotifier<AuthModel> {
  AuthViewModel() : super(_initialValue);

  static AuthModel _initialValue = AuthModel(OperationStatus.INACTIVE, null);

  String verifyId;
  AuthCredential authCredential;

  Future<void> verifyPhone({String phonenumber}) async {

    _initialValue.ops = OperationStatus.LOADING;
    state = _initialValue;

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phonenumber,
      verificationCompleted: (AuthCredential credential) {},
      verificationFailed: (FirebaseAuthException error) {},
      codeSent: (String verificationId, [int forceCodeResend]) {

        _initialValue.ops = OperationStatus.SUCCESSFUL;
        verifyId = verificationId;
        state = _initialValue;

      },
      codeAutoRetrievalTimeout: (String verificationId) {

        _initialValue.ops = OperationStatus.SUCCESSFUL;
        verifyId = verificationId;
        state = _initialValue;

      },
      timeout: const Duration(seconds: 30),
    );
  }

  Future<String> authUser({String sentCode, ProfileModel profileModel}) async {
    String userID;

    if (FirebaseAuth.instance.currentUser != null) {
      userID = FirebaseAuth.instance.currentUser.uid;
      saveData(data: userID, key: "ID");
      getUser();
    } else {
      authCredential = PhoneAuthProvider.credential(verificationId: verifyId, smsCode: sentCode);
      FirebaseAuth.instance.signInWithCredential(authCredential).then((value) {
        userID = value.user.uid;
        saveData(data: userID, key: "ID");
        writeUser(profileModel: profileModel);
      });
    }

    return userID;
  }


  void writeUser({ProfileModel profileModel}) {

  }

  void getUser() {

  }

}

class AuthModel {
  AuthModel(this.ops, this.profileModel);

  OperationStatus ops;
  ProfileModel profileModel;

}