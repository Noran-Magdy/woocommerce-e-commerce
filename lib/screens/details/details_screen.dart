import 'package:flutter/material.dart';

import '../../models/Product.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  DetailsScreen({
    this.productId,
    this.rating,
  });
  final String productId;
  final rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: rating),
      ),
      //body: Body(product: agrs.product),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({@required this.product});
}
