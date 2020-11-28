import 'package:ecommerce/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';
import '../../utils/price_utils.dart';

class CartItem extends StatelessWidget {
  final CartItemModel cartItemModel;

  const CartItem(this.cartItemModel);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: cartItemModel,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              /**
               *  Product Image
               */
              SizedBox(
                height: 80,
                width: 80,
                child: FadeInImage.assetNetwork(
                  placeholder: Constants.IMAGE_PLACEHOLDER,
                  image: cartItemModel?.product?.images?.first,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 30,
              ),

              /**
               *  Item Description
               */
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        cartItemModel.product.name,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                        maxLines: 3,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Consumer<CartItemModel>(
                        builder: (_, cartItem, __) {
                          return Text(
                            "R\$ ${PriceUtils.convertPriceBRL(cartItem.totalPrice)}",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              /*
           * 
           *    Quantity
           */
              Consumer<CartItemModel>(
                builder: (_, cartItem, __) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: cartItem.increment,
                        child: Icon(
                          Icons.add,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          cartItem.quantity.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      InkWell(
                        onTap: cartItem.decrement,
                        child: Icon(
                          Icons.remove,
                          color: cartItem.quantity < 1
                              ? Colors.grey[300]
                              : Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
