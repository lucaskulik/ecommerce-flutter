import 'package:ecommerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/routes.dart';
import 'cart_content.dart';

class CartBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider = Provider.of<CartProvider>(context);

    if (_cartProvider.items.isEmpty) {
      return Center(
        child: Text(
          "O carrinho está vazio",
          style: TextStyle(
            fontSize: 24,
            color: Colors.grey[500],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /**
           *  Preço Total
           */
          CartContent(),
          /**
           *  Botão de Endereço
           */
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.ADDRESS);
            },
            elevation: 0,
            textColor: Colors.white,
            color: Colors.lightBlueAccent,
            child: Container(
              child: Text(
                "CONTINUAR PARA ENDEREÇO",
                softWrap: false,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
