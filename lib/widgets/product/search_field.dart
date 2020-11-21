import 'package:ecommerce/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);

    TextEditingController searchController = new TextEditingController();

    searchController.text = _productProvider.search;

    bool searched =
        _productProvider.search != null && _productProvider.search.isNotEmpty;

    return TextField(
      controller: searchController,
      autofocus: false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300],
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        hintText: "Buscar",
        fillColor: Colors.grey[150],
        filled: true,
        prefixIcon: searched
            ? InkWell(
                onTap: () => _productProvider.clearSearch(),
                child: Icon(
                  Icons.close,
                  color: Colors.black87,
                ),
              )
            : null,
        suffixIcon: InkWell(
          onTap: () =>
              _productProvider.searchProducts(searchController.value.text),
          child: Icon(
            Icons.search,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
