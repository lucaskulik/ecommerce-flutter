import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  String id;
  String firstName;
  String lastName;
  String email;
  String password;

  UserModel({this.id, this.email});

  Map<String, dynamic> toMap() {
    return {
      "firstName": this.firstName,
      "lastName": this.lastName,
      "email": this.email
    };
  }

  UserModel.fromDocument(DocumentSnapshot doc) {
    this.id = doc.id;
    this.firstName = doc.data()['firstName'] ?? "";
    this.lastName = doc.data()['lastName'] ?? "";
    this.email = doc.data()['email'] ?? "";
  }

  DocumentReference get _userReference =>
      FirebaseFirestore.instance.doc("users/$id");

  CollectionReference get cartReference => _userReference.collection("cart");
}
