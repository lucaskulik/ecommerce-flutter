import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/dtos/viacep_dto.dart';
import 'package:ecommerce/models/address_model.dart';
import 'package:ecommerce/models/cart_item_model.dart';
import 'package:ecommerce/services/viacep_service.dart';
import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';
import '../models/user_model.dart';
import 'user_provider.dart';

class CartProvider extends ChangeNotifier {
  ViaCepService _viaCepService = new ViaCepService();
  UserModel user;
  num totalPrice = 0.0;
  List<CartItemModel> items = [];
  AddressModel addressModel = null;

  CartProvider() {
    _loadItems();
  }

  void updateUser(UserProvider userProvider) async {
    user = await userProvider.user;
    items.clear();
    if (user != null) {
      _loadItems();
    }
  }

  Future<void> _loadItems() async {
    try {
      final QuerySnapshot cartSnap = await user.cartReference.get();
      items = await cartSnap.docs
          .map((doc) =>
              CartItemModel.fromDocument(doc)..addListener(_updateItem))
          .toList();

      _updateItem();
    } catch (e) {
      print(e);
    }
  }

  void addToCart(ProductModel product) {
    try {
      final cartItem =
          items.firstWhere((element) => element.existsProductInCart(product));
      cartItem.increment();
    } catch (e) {
      final cartItem = CartItemModel.fromProduct(product);
      cartItem.addListener(_updateItem);
      items.add(cartItem);
      user.cartReference
          .add(cartItem.toCartItemMap())
          .then((doc) => cartItem.id = doc.id);
      _updateItem();
    }
    notifyListeners();
  }

  void _updateItem() {
    totalPrice = 0.0;

    if (items != null && items.isNotEmpty) {
      for (int i = 0; i < items.length; i++) {
        final cartItem = items[i];

        if (cartItem.quantity == 0) {
          _removeOfCart(cartItem);
          continue;
        }

        totalPrice += cartItem.totalPrice;

        _updateItemFirebase(cartItem);
      }
    }

    notifyListeners();
  }

  Future<void> getAddressByCEP(String cep) async {
    cep = cep.replaceAll(new RegExp(r"[^\s\w]"), "");

    print("CEP $cep");

    try {
      final ViaCepDTO viaCepDTO =
          await this._viaCepService.getAddressByCEP(cep);

      if (viaCepDTO != null) {
        addressModel = AddressModel.fromViaCEP(viaCepDTO);
      } else {
        addressModel = new AddressModel();
      }

      print(addressModel.city);

      notifyListeners();
    } catch (e) {
      return Future.error(e);
    }
  }

  cleanAddress() {
    addressModel = null;
    notifyListeners();
  }

  Future<void> _removeOfCart(CartItemModel cartItemModel) async {
    items.removeWhere((element) => element.id == cartItemModel.id);
    user.cartReference.doc(cartItemModel.id).delete();
    cartItemModel.removeListener(_updateItem);
    notifyListeners();
  }

  Future<void> _updateItemFirebase(CartItemModel cartItemModel) async {
    if (cartItemModel.id != null) {
      await user.cartReference.doc(cartItemModel.id).update(
            cartItemModel.toCartItemMap(),
          );
    }
  }
}
