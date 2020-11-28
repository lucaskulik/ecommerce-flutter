import 'package:ecommerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddressBody extends StatelessWidget {
  final GlobalKey<FormState> _formKey;

  const AddressBody(this._formKey);

  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider = Provider.of<CartProvider>(context);

    if (_cartProvider.addressModel == null) return Container();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              /**
               * 
               *    Rua
               * 
               */
              TextFormField(
                initialValue: _cartProvider.addressModel.street,
                decoration: InputDecoration(
                  labelText: "Rua/Avenida",
                  hintText: "Av. Alguma coisa",
                ),
                onSaved: (value) {
                  _cartProvider.addressModel.street = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Campo obrigatório!";

                  return null;
                },
                keyboardType: TextInputType.streetAddress,
              ),
              const SizedBox(
                height: 15,
              ),

              /**
               * 
               *    Número e Complemento
               * 
               */
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _cartProvider.addressModel.number,
                      decoration: InputDecoration(
                        labelText: "Número",
                        hintText: "1234",
                      ),
                      onSaved: (value) {
                        _cartProvider.addressModel.number = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Campo obrigatório!";

                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: false, signed: false),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: _cartProvider.addressModel.number,
                      decoration: InputDecoration(
                        labelText: "Complemento",
                        hintText: "Apartamento e Bloco",
                      ),
                      onSaved: (value) {
                        _cartProvider.addressModel.complement = value;
                      },
                      validator: (value) {
                        return null;
                      },
                      inputFormatters: [],
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),

              /**
               * 
               *   Bairro
               * 
               */
              TextFormField(
                initialValue: _cartProvider.addressModel.district,
                decoration: InputDecoration(
                  labelText: "Bairro",
                  hintText: "Centro",
                ),
                onSaved: (value) {
                  _cartProvider.addressModel.district = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Campo obrigatório!";

                  return null;
                },
                keyboardType: TextInputType.streetAddress,
              ),
              const SizedBox(
                height: 15,
              ),
              /**
               * 
               *   Cidade e Estado
               * 
               */
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _cartProvider.addressModel.city,
                      decoration: InputDecoration(
                        labelText: "Cidade",
                        hintText: "São Paulo",
                      ),
                      onSaved: (value) {
                        _cartProvider.addressModel.city = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Campo obrigatório!";

                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: false, signed: false),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: _cartProvider.addressModel.state,
                      decoration: InputDecoration(
                        labelText: "Estado",
                        hintText: "SP",
                      ),
                      onSaved: (value) {
                        _cartProvider.addressModel.state = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Campo obrigatório!";

                        return null;
                      },
                      inputFormatters: [],
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
