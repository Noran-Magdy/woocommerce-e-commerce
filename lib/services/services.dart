import 'package:woocommerce/woocommerce.dart';
import 'package:woocommerce_app/constants.dart';

class WooCommerenceApi {
  static WooCommerce wooCommerce = WooCommerce(
    baseUrl: baseUrl,
    consumerKey: consumerKey,
    consumerSecret: consumerSecret,
  );

  Future<List<WooProduct>> getAllProducts() async {
    final myProducts = await wooCommerce.getProducts(
      perPage: 10,
    );
    print('woocommerce products' + '${myProducts.length}');
    return myProducts;
  }

  Future<List<WooProductCategory>> getAllCategories() async {
    final myCategories = await wooCommerce.getProductCategories(
      perPage: 10,
      hideEmpty: true,
    );
    print('woocommerce categories ' + '${myCategories.length}');
    return myCategories;
  }
}
