import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/address_model.dart';
import 'package:ecommerce/models/user_model.dart';

class OrderModel {
  String id;
  String userId;
  String address;
  double totalPrice;
  int itemsCount;

  OrderModel({this.id, this.userId, this.address, this.totalPrice});

  OrderModel.fromDocument(DocumentSnapshot document) {
    this.id = document.id;
    this.userId = document.data()["userId"] ?? "";
    this.address = document.data()["address"] ?? "";
    this.totalPrice = document.data()["totalPrice"] as double ?? 0.0;
    this.itemsCount = document.data()["itemsCount"] as int ?? 0;
  }

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "address": address,
      "totalPrice": totalPrice,
      "itemsCount": itemsCount
    };
  }

  OrderModel.fromOrder(
      UserModel userModel, AddressModel addressModel, double price, int items) {
    userId = userModel.id;
    address = addressModel.toString();
    totalPrice = price;
    itemsCount = items;
  }

  Map<String, dynamic> toOrderMap() {
    return {
      'userId': userId,
      'address': address,
      'totalPrice': totalPrice,
      'itemsCount': itemsCount
    };
  }

  @override
  String toString() {
    return 'Order{id: $id, userId: $userId, address: $address, totalPrice: $totalPrice, itemsCount: $itemsCount }';
  }
}
