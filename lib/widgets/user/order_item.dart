import 'package:ecommerce/models/order_model.dart';
import 'package:ecommerce/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderItem extends StatelessWidget {
  final OrderModel orderModel;

  const OrderItem(this.orderModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "PID: ",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "${orderModel.id}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.amber[900],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Preço total: ",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "${orderModel.totalPrice}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.amber[900],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total de itens: ",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "${orderModel.itemsCount}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.amber[900],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
