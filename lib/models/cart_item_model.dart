import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'product_model.dart';

class CartItemModel extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String id;
  String productId;
  ProductModel product;
  int quantity;

  CartItemModel.fromDocument(DocumentSnapshot doc) {
    id = doc.id;
    productId = doc.get("pid") as String;
    quantity = doc.get("quantity") as int;
    firestore.doc("products/$productId").get().then((produto) {
      product = ProductModel.fromDocument(produto);
      notifyListeners();
    });
  }

  CartItemModel.fromProduct(ProductModel productModel) {
    productId = productModel.id;
    quantity = 1;
    this.product = productModel;
  }

  Map<String, dynamic> toCartItemMap() {
    return {'pid': productId, 'quantity': quantity};
  }

  bool existsProductInCart(ProductModel product) {
    return product.id == productId;
  }

  increment() {
    quantity++;
    notifyListeners();
  }

  decrement() {
    quantity--;
    notifyListeners();
  }

  num get unitPrice {
    if (product == null) return 0;
    return product.price ?? 0;
  }

  num get totalPrice => unitPrice * quantity;
}
