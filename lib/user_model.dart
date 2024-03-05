import 'dart:async';

class UserModel{
  final String? id;
  final String fullname;
  final String email;
  final String phoneNumber;
  final String password;

const UserModel({
    this.id;
    required this.email,
    required this.password,
    required this.fullname,
    required this.phoneNumber,}
);

toJson(){
  return{
    "Full Name": fullname,
    "email" : email,
    "Phone": phoneNumber,
    "Password": password,
  }
}
}