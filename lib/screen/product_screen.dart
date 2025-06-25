import 'dart:io';

import 'package:dart_shop/core/app_state.dart';
import 'package:dart_shop/core/base_screen.dart';
import 'package:chalkdart/chalkstrings.dart';
import 'package:dart_shop/exception/custom_exception.dart';

class ProductScreen extends BaseScreen {
  ProductScreen() : super(title: "상품 목록");

  @override
  void show() {
    AppState appState = AppState();

    print("------------------------------------------------------------");
    print("상품 목록".bold.ghostWhite);
    print("------------------------------------------------------------");
    appState.mall.showProducts();
    print("============================================================");
    print("-1. 뒤로가기".gray.bold);
    print("0. 종료".white.bold);
    print("------------------------------------------------------------");

    // 입력 받는 코드
    stdout.write("입력> ");
    String? input = stdin.readLineSync();

    if (input == "-1") {
      appState.page = "HOME";
    } else if (input == "0") {
      exitConfirm();
    } else if (input == "1") {
      appState.page = "LIST";
    } else {
      throw CustomException(appState.page);
    }
  }
}
