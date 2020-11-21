import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String search;

  List<ProductModel> _allProducts = [];
  List<ProductModel> _filteredProducts = [];
  List<ProductModel> _products = [];

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
    updateList();
  }

  searchProducts(String search) {
    this.search = search;
    _filteredProducts = _allProducts
        .where((product) =>
            product.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
    updateList();
  }

  clearSearch() {
    this.search = null;
    _filteredProducts = [];
    updateList();
  }

  updateList() {
    _products =
        search != null && search.isNotEmpty ? _filteredProducts : _allProducts;
    notifyListeners();
  }

  CollectionReference get _firestore =>
      _firebaseFirestore.collection("products");

  List<ProductModel> get products => _products;

  int get count => _products.length;
}
