import 'package:brasil_fields/brasil_fields.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CepInput extends StatelessWidget {
  TextEditingController _cepController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider = Provider.of<CartProvider>(context);

    if (_cartProvider.addressModel != null &&
        _cartProvider.addressModel.zipCode.isNotEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _cartProvider.addressModel.zipCode,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  _cartProvider.cleanAddress();
                },
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              enabled: !_cartProvider.loading,
              controller: _cepController,
              decoration: InputDecoration(
                hintText: "00.000-000",
                labelText: "CEP",
                suffix: IconButton(
                  onPressed: () {
                    _cartProvider.getAddressByCEP(_cepController.value.text);
                  },
                  icon: Icon(
                    Icons.search,
                  ),
                ),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter()
              ],
              keyboardType: TextInputType.numberWithOptions(
                decimal: false,
                signed: false,
              ),
            ),
            _cartProvider.loading
                ? Container(
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.transparent,
                      valueColor: AlwaysStoppedAnimation(
                          Theme.of(context).primaryColor),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
