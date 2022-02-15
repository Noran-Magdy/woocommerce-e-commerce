import 'package:flutter/cupertino.dart';
import 'package:woocommerce/models/products.dart';

class FavoriteNotifier extends ChangeNotifier {
  List<WooProduct> _favoriteList = [];
  List<WooProduct> get favoriteList => _favoriteList;

  void addToFav(WooProduct product) {
    _favoriteList.add(product);
    notifyListeners();
  }

  void removeFromFav(WooProduct product) {
    _favoriteList.remove(product);
    notifyListeners();
  }
}
