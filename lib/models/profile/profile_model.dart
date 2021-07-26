import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  DataBean data;

  ProfileModel({this.data});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

@JsonSerializable()
class DataBean {
  final String fullname;
  String phonenumber;
  CurrentLocationBean currentLoaction;
  FavouriteLocationBean favouriteLocation;
  String userID;
  String subscription;
  String profileImage;
  DeviceInfoBean deviceInfo;
  EloudCrySetMessageBean eloudCrySetMessage;
  List<CloseOnesBean> closeOnes;
  List<PendingCloseRequestsBean> pendingCloseRequests;

  DataBean({this.fullname, this.phonenumber, this.currentLoaction, this.favouriteLocation, this.userID, this.subscription, this.profileImage, this.deviceInfo, this.eloudCrySetMessage, this.closeOnes, this.pendingCloseRequests});

  factory DataBean.fromJson(Map<String, dynamic> json) => _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

@JsonSerializable()
class PendingCloseRequestsBean {
  String fullname;
  String phonenumber;
  String userID;
  String acceptanceStatus;

  PendingCloseRequestsBean({this.fullname, this.phonenumber, this.userID, this.acceptanceStatus});

  factory PendingCloseRequestsBean.fromJson(Map<String, dynamic> json) => _$PendingCloseRequestsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$PendingCloseRequestsBeanToJson(this);
}

@JsonSerializable()
class CloseOnesBean {
  String fullname;
  String phonenumber;
  String userID;
  String acceptanceStatus;
  num acceptedDate;

  CloseOnesBean({this.fullname, this.phonenumber, this.userID, this.acceptanceStatus, this.acceptedDate});

  factory CloseOnesBean.fromJson(Map<String, dynamic> json) => _$CloseOnesBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CloseOnesBeanToJson(this);
}

@JsonSerializable()
class EloudCrySetMessageBean {
  String message;
  num messageSetDate;
  num updatedDate;

  EloudCrySetMessageBean({this.message, this.messageSetDate, this.updatedDate});

  factory EloudCrySetMessageBean.fromJson(Map<String, dynamic> json) => _$EloudCrySetMessageBeanFromJson(json);

  Map<String, dynamic> toJson() => _$EloudCrySetMessageBeanToJson(this);
}

@JsonSerializable()
class DeviceInfoBean {
  String deviceUUID;
  String deviceName;

  DeviceInfoBean({this.deviceUUID, this.deviceName});

  factory DeviceInfoBean.fromJson(Map<String, dynamic> json) => _$DeviceInfoBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceInfoBeanToJson(this);
}

@JsonSerializable()
class FavouriteLocationBean {
  String latlng;
  String addressName;

  FavouriteLocationBean({this.latlng, this.addressName});

  factory FavouriteLocationBean.fromJson(Map<String, dynamic> json) => _$FavouriteLocationBeanFromJson(json);

  Map<String, dynamic> toJson() => _$FavouriteLocationBeanToJson(this);
}

@JsonSerializable()
class CurrentLocationBean {
  String latlng;
  String addressName;

  CurrentLocationBean({this.latlng, this.addressName});

  factory CurrentLocationBean.fromJson(Map<String, dynamic> json) => _$CurrentLocationBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentLocationBeanToJson(this);
}

