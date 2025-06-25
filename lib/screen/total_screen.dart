import 'dart:io';

import 'package:dart_shop/constants.dart';
import 'package:dart_shop/core/app_state.dart';
import 'package:dart_shop/core/base_screen.dart';
import 'package:chalkdart/chalkstrings.dart';
import 'package:dart_shop/exception/custom_exception.dart';

class TotalScreen extends BaseScreen {
  TotalScreen() : super(title: "장바구니에 담긴 상품의 총 가격");

  @override
  void show() {
    AppState appState = AppState();

    print("------------------------------------------------------------");
    print("장바구니에 담긴 상품의 총 가격".bold.ghostWhite);
    print("------------------------------------------------------------");
    appState.mall.showTotal();
    print("============================================================");
    print("-1. 뒤로가기".gray.bold);
    print("0. 종료".white.bold);
    print("------------------------------------------------------------");
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
