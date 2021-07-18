import 'package:cloud_firestore/cloud_firestore.dart';

class CloudService {

  final databaseReference = FirebaseFirestore.instance;

  static String users = "users";
  static String messages = "messages";

  Future<void> writeNewUser({String userID, Map<String, dynamic> userData}) async {
    await databaseReference.collection(users).doc(userID).set(userData);
  }

  Future<void> updateUser({String userID, Map<String, dynamic> fieldsToUpdate}) async {
    await databaseReference.collection(users).doc(userID).update(fieldsToUpdate);
  }

  Future<DocumentReference> getUser(String usersID) async {
    return databaseReference.collection(users).doc(usersID);
  }

  Future<void> writeAMessage({String requestType, String usersID, Map<String, dynamic> mapRequestData,}) async {
    await databaseReference.collection(messages).doc().set(mapRequestData);
  }

  CollectionReference requestMessageCollection() {
    return databaseReference.collection(messages);
  }

  Future<QuerySnapshot> usersMessages({String cloudUUID,}) {
    return databaseReference.collection(messages).where("userID", isEqualTo: cloudUUID)
        .get();
  }

}