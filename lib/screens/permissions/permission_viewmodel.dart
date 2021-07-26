import 'package:hooks_riverpod/hooks_riverpod.dart';

class PermissionViewModel extends StateNotifier<PermissionsModel> {
  PermissionViewModel() : super(_initialValue);

  static PermissionsModel _initialValue = PermissionsModel(false, false, false);

  void setRecordings(bool value) {
    _initialValue.setRecordings = value;
    state = _initialValue;
  }

  void setLocation(bool value) {
    _initialValue.setLocation = value;
    state = _initialValue;
  }

  void setContacts(bool value) {
    _initialValue.setContacts = value;
    state = _initialValue;
  }

  bool isAllPermissionSet() {
    return state.setLocation == true &&
        state.setContacts == true &&
        state.setRecordings == true;
  }

}

class PermissionsModel {
  PermissionsModel(this.setContacts, this.setLocation, this.setRecordings);

  bool setRecordings;
  bool setLocation;
  bool setContacts;
}
