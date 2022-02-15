import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:woocommerce/models/product_category.dart';
import 'package:woocommerce/models/products.dart';
import 'package:woocommerce_app/services/provider.dart';
import 'package:woocommerce_app/services/services.dart';

final productsProvider =
    FutureProvider.autoDispose<List<WooProduct>>((ref) async {
  // ref.maintainState = true;
  final products = await WooCommerenceApi().getAllProducts();
  return products;
});

final productCategoriesProvider =
    FutureProvider.autoDispose<List<WooProductCategory>>((ref) async {
  ref.maintainState = true;
  final categories = await WooCommerenceApi().getAllCategories();
  return categories;
});

final favoriteChangeNotifierProvider =
    ChangeNotifierProvider<FavoriteNotifier>((ref) => FavoriteNotifier());
