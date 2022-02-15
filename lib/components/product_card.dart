import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    this.imageUrl,
    this.title,
    this.id,
    this.price,
    this.press,
    this.favoritePressFunction,
    this.containerFavColor,
    this.favIconColor,
  }) : super(key: key);

  final double width, aspectRetio;
  final String imageUrl;
  final String title;
  final int id;
  final String price;
  final Function press;
  final Function favoritePressFunction;
  final Color containerFavColor;
  final Color favIconColor;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(widget.width),
        child: GestureDetector(
          onTap: widget.press,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: widget.id,
                    child: Image.asset(widget.imageUrl),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${widget.price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: widget.favoritePressFunction,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color: widget.containerFavColor,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: widget.favIconColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
