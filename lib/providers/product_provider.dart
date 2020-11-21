import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  List<ProductModel> _allProducts = [];

  ProductProvider() {
    loadAllProducts();
  }

  loadAllProducts() async {
    final QuerySnapshot products = await _firestore.get();
    _allProducts = products.docs.map((e) {
      ProductModel product = ProductModel.fromDocument(e);
      print("${product.toString()}");
      return product;
    }).toList();
    print("${_allProducts.length} Produtos Carregados");
    notifyListeners();
  }

  CollectionReference get _firestore =>
      _firebaseFirestore.collection("products");

  List<ProductModel> get products => [..._allProducts];

  int get count => _allProducts.length;
}
