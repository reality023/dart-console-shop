import 'package:dart_shop/constants.dart';
import 'package:dart_shop/core/app_state.dart';
import 'package:dart_shop/core/base_screen.dart';
import 'package:dart_shop/exception/custom_exception.dart';
import 'package:dart_shop/screen/add_screen.dart';
import 'package:dart_shop/screen/cart_screen.dart';
import 'package:dart_shop/screen/home_screen.dart';
import 'package:dart_shop/screen/product_screen.dart';
import 'package:dart_shop/screen/total_screen.dart';

void program() {
  AppState appState = AppState();

  while (true) {
    late BaseScreen screen;

    if (appState.page == Page.HOME.name) {
      screen = HomeScreen();
    } else if (appState.page == Page.LIST.name) {
      screen = ProductScreen();
    } else if (appState.page == Page.ADD.name) {
      screen = AddScreen();
    } else if (appState.page == Page.TOTAL.name) {
      screen = TotalScreen();
    } else if (appState.page == Page.CART.name) {
      screen = CartScreen();
    }

    screen.clearScreen();

    try {
      screen.show();
    } on CustomException catch (e) {
      screen.errorAlert(e.message);
    }
  }
}
