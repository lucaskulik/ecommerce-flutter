import 'package:ecommerce/providers/order_provider.dart';
import 'package:ecommerce/widgets/user/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OrderProvider _orderProvider = Provider.of<OrderProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Lista de pedidos",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _orderProvider.orders.length,
              itemBuilder: (_, index) {
                return OrderItem(_orderProvider.orders[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
