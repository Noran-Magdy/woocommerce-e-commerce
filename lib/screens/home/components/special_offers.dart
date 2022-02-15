import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:woocommerce/models/product_category.dart';
import 'package:woocommerce_app/constants.dart';
import 'package:woocommerce_app/services/provider_services.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Categories",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Consumer(builder: (context, ScopedReader watch, child) {
          final responseAsyncValue = watch(productCategoriesProvider);
          return responseAsyncValue.map(
            data: (asyncData) {
              return specialOfferList(asyncData.value);
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
        //   physics: BouncingScrollPhysics(),
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: [

        //       SizedBox(width: getProportionateScreenWidth(20)),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  Widget specialOfferList(List<WooProductCategory> data) {
    return Container(
      height: 260,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          print('data length is ${data.length}');
          return SpecialOfferCard(
            category: data[index].name,
            imageUrl: data[index].image.src,
            press: () {},
            numOfBrands: data[index].count,
          );
        },
      ),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required this.category,
    @required this.imageUrl,
    @required this.numOfBrands,
    @required this.press,
  }) : super(key: key);

  final String category, imageUrl;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //  Image(
                //    image: image,
                //     fit: BoxFit.cover,
                //   ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
