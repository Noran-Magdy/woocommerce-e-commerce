import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:woocommerce/models/products.dart';
import 'package:woocommerce_app/components/product_card.dart';
import 'package:woocommerce_app/constants.dart';
import 'package:woocommerce_app/screens/details/details_screen.dart';
import 'package:woocommerce_app/services/provider.dart';
import 'package:woocommerce_app/services/provider_services.dart';

import '../../../size_config.dart';
import 'section_title.dart';

FavoriteNotifier favList = FavoriteNotifier();

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Consumer(builder: (context, watch, child) {
          final responseAsyncValue = watch(productsProvider);
          favList = watch(favoriteChangeNotifierProvider);
          return responseAsyncValue.map(
            data: (asyncData) {
              return allProductList(asyncData.value);
            },
            loading: (asyncLoading) {
              return SpinKitCircle(
                color: kPrimaryColor,
                size: 30,
              );
            },
            error: (asyncError) {
              return Text(asyncError.toString());
            },
          );
        }),
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: [
        //       list(),
        //       SizedBox(width: getProportionateScreenWidth(20)),
        //     ],
        //   ),
        // )
      ],
    );
  }

  Widget allProductList(List<WooProduct> data) {
    return Container(
      height: 260,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final isFav = favList.favoriteList.firstWhere(
            (element) => element.id == data[index].id,
            orElse: () => null,
          );
          print('data length is ${data.length}');
          return ProductCard(
            id: data[index].id,
            imageUrl: data[index].images[0].src,
            price: data[index].price,
            title: data[index].name,
            favoritePressFunction: () {
              isFav == null
                  ? favList.addToFav(data[index])
                  : favList.removeFromFav(data[index]);
            },
            containerFavColor: isFav == null
                ? kSecondaryColor.withOpacity(0.1)
                : kPrimaryColor.withOpacity(0.15),
            favIconColor: isFav == null ? Color(0xFFDBDEE4) : Color(0xFFFF4848),
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    rating: data[index].ratingCount.toDouble(),
                    productId: data[index].id.toString(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
