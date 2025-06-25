import 'dart:io';

import 'package:dart_shop/constants.dart';
import 'package:dart_shop/core/app_state.dart';
import 'package:dart_shop/core/base_screen.dart';
import 'package:chalkdart/chalkstrings.dart';
import 'package:dart_shop/exception/custom_exception.dart';

class HomeScreen extends BaseScreen {
  HomeScreen() : super(title: "홈");

  @override
  void show() {
    AppState appState = AppState();

    print("------------------------------------------------------------");
    print("1. 상품 목록 보기".red);
    print("2. 장바구니에 상품 추가".green);
    print("3. 장바구니에 담긴 상품의 총 가격".blue);
    print("4. 장바구니에 담긴 상품 목록 보기".yellow);
    print("5. 장바구니 초기화".magenta);
    print("0. 종료".white.bold);
    print("------------------------------------------------------------");

    // 입력 받는 코드
    stdout.write("입력> ");
    String? input = stdin.readLineSync();

    if (input == "0") {
      exitConfirm();
    } else if (input == "1") {
      appState.page = Page.LIST.name;
    } else if (input == "2") {
      appState.page = Page.ADD.name;
    } else if (input == "3") {
      appState.page = Page.TOTAL.name;
    } else if (input == "4") {
      appState.page = Page.CART.name;
    } else if (input == "5") {
      appState.mall.clearCart();
      super.successAlert("장바구니가 초기화되었습니다.");
    } else {
      throw CustomException(appState.page);
    }
  }
}
