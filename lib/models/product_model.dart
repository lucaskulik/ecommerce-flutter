import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String id;
  String name;
  String description;
  double price;
  List<String> images;

  ProductModel({this.id, this.name, this.description, this.price, this.images});

  ProductModel.fromDocument(DocumentSnapshot document) {
    this.id = document.id;
    this.name = document.data()["name"] ?? "";
    this.description = document.data()["description"] ?? "";
    this.price = document.data()["price"] as double ?? 0.0;
    this.images = List<String>.from(document.data()["images"] as List ?? []);
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "description": description,
      "price": price,
      "images": images
    };
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, price: $price, images: $images}';
  }
}
