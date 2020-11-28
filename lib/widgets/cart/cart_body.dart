import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/utils/price_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/routes.dart';
import 'cart_item.dart';

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
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TOTAL",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "R\$ ${PriceUtils.convertPriceBRL(_cartProvider.totalPrice)}",
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /**
           *  Items
           */
          ListView.builder(
            shrinkWrap: true,
            itemCount: _cartProvider.items.length,
            itemBuilder: (_, index) {
              return CartItem(_cartProvider.items[index]);
            },
          ),
          const SizedBox(
            height: 30,
          ),
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
              padding: EdgeInsets.symmetric(
                vertical: 15,
              ),
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
