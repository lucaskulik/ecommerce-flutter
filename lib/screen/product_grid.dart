import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/providers/product_provider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/product/product_grid_item.dart';
import 'package:ecommerce/widgets/product/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            alignment: Alignment.center,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: SearchField(),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                "assets/images/banner_01.png",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Destaques",
              style: TextStyle(fontSize: 20),
            ),
            Consumer<ProductProvider>(
              builder: (_, productProvider, child) {
                List<ProductModel> products = productProvider.products;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: productProvider.count,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 30,
                    childAspectRatio: 200 / 330,
                  ),
                  itemBuilder: (context, index) {
                    return ProductGridItem(products[index]);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
