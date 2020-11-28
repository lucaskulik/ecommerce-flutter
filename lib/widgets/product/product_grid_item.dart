import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/utils/price_utils.dart';
import 'package:ecommerce/utils/routes.dart';
import 'package:flutter/material.dart';

class ProductGridItem extends StatelessWidget {
  final ProductModel product;

  const ProductGridItem(this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.PRODUCT, arguments: product);
      },
      child: Card(
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: FadeInImage.assetNetwork(
                  placeholder: Constants.IMAGE_PLACEHOLDER,
                  image: product.images.first,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Divider(),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w300,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      softWrap: true,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "R\$ ${PriceUtils.convertPriceBRL(product.price)}",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
