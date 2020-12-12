import 'package:ecommerce/widgets/cart/cart_checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Finalizar pedido",
          style: TextStyle(
            color: Colors.grey[500],
          ),
        ),
        brightness: Brightness.light,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[500]),
      ),
      body: CheckoutView(),
    );
  }
}
