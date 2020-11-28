import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/utils/price_utils.dart';
import 'package:ecommerce/widgets/cart/cart_icon.dart';
import 'package:ecommerce/widgets/product/product_action_button.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductModel product;
  GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    product = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      key: _scaffoldState,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Product",
          style: TextStyle(
            color: Colors.grey[500],
          ),
        ),
        actions: [CartIcon()],
        brightness: Brightness.light,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[500]),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            items: product.images
                .map(
                  (image) => FadeInImage.assetNetwork(
                    placeholder: Constants.IMAGE_PLACEHOLDER,
                    image: image,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              scrollDirection: Axis.vertical,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  product.name,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "R\$ ${PriceUtils.convertPriceBRL(product.price)}",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    "Descrição",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    product.description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ProductActionButton(product, _scaffoldState),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
