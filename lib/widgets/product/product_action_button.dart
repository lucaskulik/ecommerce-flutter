import 'package:ecommerce/providers/cart_provider.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../providers/user_provider.dart';
import '../../utils/routes.dart';

class ProductActionButton extends StatelessWidget {
  final ProductModel product;
  GlobalKey<ScaffoldState> _scaffoldState;

  ProductActionButton(this.product, this._scaffoldState);

  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider = Provider.of<CartProvider>(context);
    final UserProvider _userProvider = Provider.of<UserProvider>(context);

    if (_userProvider.isLogado) {
      return RaisedButton(
        onPressed: () {
          _cartProvider.addToCart(product);
          popupConfirmation(context);
        },
        elevation: 0,
        textColor: Colors.white,
        color: Colors.greenAccent,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: Text(
            "ADICIONAR AO CARRINHO",
            softWrap: false,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            maxLines: 2,
          ),
        ),
      );
    }

    return RaisedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.LOGIN);
      },
      elevation: 0,
      textColor: Colors.white,
      color: Colors.redAccent,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Text(
          "FAZER LOGIN",
          softWrap: false,
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
          maxLines: 2,
        ),
      ),
    );
  }

  popupConfirmation(BuildContext buildContext) {
    showDialog(
      context: buildContext,
      child: AlertDialog(
        contentPadding: EdgeInsets.all(4),
        content: Container(
          height: 240,
          width: 300,
          child: Column(
            children: [
              Container(
                height: 150,
                width: 170,
                child: FlareActor(
                  "assets/flare/success.flr",
                  animation: "check",
                ),
              ),
              Text(
                "Produto Adicionado ao Carrinho",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(buildContext).pop();
                },
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.greenAccent, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
