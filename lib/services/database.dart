import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haifma_v2/models/user.dart';
class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference UserCollection = Firestore.instance.collection('USER');

  Future updateUserData(String name, String sex, int age) async {
    return await UserCollection.document(uid).setData(
      {
        'name': name,
        'sex': sex,
        'age': age,
      });
  }
}