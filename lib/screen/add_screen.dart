import 'dart:io';

import 'package:dart_shop/constants.dart';
import 'package:dart_shop/core/app_state.dart';
import 'package:dart_shop/core/base_screen.dart';
import 'package:chalkdart/chalkstrings.dart';
import 'package:dart_shop/exception/custom_exception.dart';
import 'package:dart_shop/shopping_mall.dart';

class AddScreen extends BaseScreen {
  AddScreen() : super(title: "장바구니에 상품 추가");

  @override
  void show() {
    AppState appState = AppState();
    ShoppingMall mall = ShoppingMall();

    print("------------------------------------------------------------");
    print("상품 목록".bold.ghostWhite);
    print("------------------------------------------------------------");
    mall.showProducts();
    print("============================================================");
    print("장바구니에 상품 추가".bold.ghostWhite + " (뒤로가기: -1, 종료: 0)");
    print("------------------------------------------------------------");

    // 입력 받는 코드
    stdout.write("추가할 상품 이름 입력> ");
    String? name = stdin.readLineSync();

    if (name == "-1") {
      appState.page = Page.HOME.name;
      return;
    } else if (name == "0") {
      exitConfirm();
    }

    // 상품명 조건 체크
    if (name == "" || name == null) {
      throw CustomException(appState.page, "상품 이름을 입력해주세요.");
    } else if (!mall.products.any((product) => product.name == name)) {
      throw CustomException(appState.page, "입력값이 올바르지 않아요 !");
    }

    stdout.write("추가할 상품 개수 입력> ");
    String? count = stdin.readLineSync();

    if (count == "-1") {
      appState.page = Page.HOME.name;
      return;
    } else if (name == "0") {
      exitConfirm();
    }

    // 상품 개수 조건 체크
    if (count == "" || count == null) {
      throw CustomException(appState.page, "상품 개수를 입력해주세요.");
    } else if (int.tryParse(count) == null) {
      throw CustomException(appState.page, "입력값이 올바르지 않아요 !");
    } else if (int.parse(count) <= 0) {
      throw CustomException(appState.page, "0개보다 많은 개수의 상품만 담을 수 있어요 !");
    }

    // 상품 장바구니로 추가
    appState.mall.addToCart(name, int.parse(count));
    appState.page = Page.HOME.name;
  }
}
