import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/widgets/address/address_body.dart';
import 'package:ecommerce/widgets/address/cep_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Endereço",
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
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CepInput(),
              AddressBody(_formKey),
              const SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: _cartProvider.addressModel != null
                    ? () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                        }
                      }
                    : null,
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
        ),
      ),
    );
  }
}
