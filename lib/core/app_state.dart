import 'package:dart_shop/constants.dart';
import 'package:dart_shop/shopping_mall.dart';

class AppState {
  static final AppState _instance = AppState._internal();

  factory AppState() {
    return _instance;
  }

  AppState._internal();

  String page = Page.HOME.name;
  ShoppingMall mall = ShoppingMall();

  set state(AppState value) {}
}
