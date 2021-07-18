import 'package:eloudcry/models/profile/profile_model.dart';
import 'package:eloudcry/utils/operation_enum.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserViewModel extends StateNotifier<UserProfileModel> {
  UserViewModel() : super(_initialValue);

  static UserProfileModel _initialValue = UserProfileModel(OperationStatus.INACTIVE, null);

  void getUser() {

  }

}

class UserProfileModel {
  UserProfileModel(this.ops, this.profileModel);

  OperationStatus ops;
  ProfileModel profileModel;
  
}