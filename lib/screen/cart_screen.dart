import 'dart:io';

import 'package:dart_shop/constants.dart';
import 'package:dart_shop/core/app_state.dart';
import 'package:dart_shop/core/base_screen.dart';
import 'package:chalkdart/chalkstrings.dart';
import 'package:dart_shop/exception/custom_exception.dart';

class CartScreen extends BaseScreen {
  CartScreen() : super(title: "장바구니에 담긴 상품 목록 보기");

  @override
  void show() {
    AppState appState = AppState();

    print("------------------------------------------------------------");
    print("장바구니 상품 목록".bold.ghostWhite);
    print("------------------------------------------------------------");
    appState.mall.showCart();
    print("============================================================");
    print("뒤로가기: -1, 종료: 0");
    stdout.write("입력> ");
    String? input = stdin.readLineSync();

    if (input == "-1") {
      appState.page = Page.HOME.name;
    } else if (input == "0") {
      exitConfirm();
    } else {
      throw CustomException(appState.page);
    }
  }
}
