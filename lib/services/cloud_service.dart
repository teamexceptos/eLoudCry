import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eloudcry/models/profile/profile_model.dart';

class CloudService {

  final databaseReference = FirebaseFirestore.instance;

  static String users = "users";
  static String messages = "messages";

  Future<void> writeNewUser(
      {String userID, Map<String, dynamic> userData}) async {
    await databaseReference.collection(users).doc(userID).set(userData);
  }

  Future<void> updateUser(
      {String userID, Map<String, dynamic> fieldsToUpdate}) async {
    await databaseReference
        .collection(users)
        .doc(userID)
        .update(fieldsToUpdate);
  }

  DocumentReference getUser(String usersID) {
    return databaseReference.collection(users).doc(usersID);
  }

  Future<void> writeAMessage({
    String requestType,
    String usersID,
    Map<String, dynamic> mapRequestData,
  }) async {
    await databaseReference.collection(messages).doc().set(mapRequestData);
  }

  CollectionReference requestMessageCollection() {
    return databaseReference.collection(messages);
  }

  Future<QuerySnapshot> usersMessages({
    String cloudUUID,
  }) {
    return databaseReference
        .collection(messages)
        .where("userID", isEqualTo: cloudUUID)
        .get();
  }

  Future<String> getUserIDToRequestForCloseness({
    String phonenumber,
  }) async {
    String userID;
    await databaseReference
        .collection(users)
        .where("phonenumber", isEqualTo: phonenumber)
        .get()
        .then((value) {
      userID = value.docs.first.id;
      print(userID = value.docs.first.data().toString());
    });

    return userID;
  }

  Future<void> requestForCloseness(
      {String requestClosenessContact,
      String fullname,
      String userID,
      String userPhonenumber}) async {

    await databaseReference.runTransaction((transaction) async {

      String requestedUserID = await getUserIDToRequestForCloseness(
          phonenumber: requestClosenessContact);

      if(requestedUserID != null) {

        DocumentSnapshot snapshot =
        await transaction.get(getUser(requestedUserID));

        ProfileModel profileModel = ProfileModel.fromJson(snapshot.data());
        List<PendingCloseRequestsBean> pendingCloseRequests =
            profileModel.data.pendingCloseRequests;

        pendingCloseRequests.add(PendingCloseRequestsBean(
            fullname: fullname,
            userID: userID,
            phonenumber: userPhonenumber,
            acceptanceStatus: "pending"));

        transaction.update(getUser(requestedUserID), {
          'pendingCloseRequests':
          pendingCloseRequests.map((e) => e.toJson()).toList(),
        });

      } else {
        throw Exception("No user with that contact details");
      }

    });
  }
}