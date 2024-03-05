import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ptu_hostel/user_model.dart';
class UserRepoeitory extends GetxController{
  static UserRepoeitory get instance=> Get.find();

  final _db = FirebaseFirestore.instance;
  createUser(UserModel user){
    _db.collection("user").add(user.toJson()).whenComplete(() => null)
  }
}