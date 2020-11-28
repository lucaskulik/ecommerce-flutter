import 'package:ecommerce/widgets/address/cep_input.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Carrinho",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            CepInput(),
          ],
        ),
      ),
    );
  }
}
