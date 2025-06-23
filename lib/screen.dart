import 'dart:io';

import 'package:chalkdart/chalkstrings.dart';
import 'package:dart_shop/shopping-mall.dart';

class Screen {
  String page = "HOME";
  final ShoppingMall mall = ShoppingMall();

  void homeScreen() {
    print("------------------------------------------------------------");
    print("1. 상품 목록 보기".red);
    print("2. 장바구니 담기".blue);
    print("3. 장바구니에 담긴 상품의 총 가격 보기".green);
    print("4. 장바구니에 담긴 상품 목록 보기".yellow);
    print("0. 종료".white.bold);
    print("------------------------------------------------------------");

    // 입력 받는 코드
    stdout.write("입력> ");
    String? input = stdin.readLineSync();

    if (input == "0") {
      exit(0);
    } else if (input == "1") {
      page = "PRODUCTS";
    }
  }

  void productsScreen() {
    print("------------------------------------------------------------");
    print("상품 목록".bold.ghostWhite);
    print("------------------------------------------------------------");
    for (var product in mall.products) {
      print("${"${product.name}".bold.white} - ${"${product.price}원"}");
    }
    print("============================================================");
    print("장바구니에 담으시려면 > \"add [상품명]\"을 입력해주세요");
    print("------------------------------------------------------------");

    print("------------------------------------------------------------");
    print("-1. 뒤로가기".gray.bold);
    print("0. 종료".white.bold);
    print("------------------------------------------------------------");

    // 입력 받는 코드
    stdout.write("입력> ");
    String? input = stdin.readLineSync();

    if (input == "-1") {
      page = "HOME";
    } else if (input == "0") {
      exit(0);
    }
  }

  void addScreen() {
    print("------------------------------------------------------------");
    print("1. 상품 추가".red);
    print("0. 뒤로가기".white.bold);
    print("------------------------------------------------------------");

    // 입력 받는 코드
    stdout.write("입력> ");
  }

  void showPage() {
    switch (page) {
      case "HOME":
        homeScreen();
        break;
      case "PRODUCTS":
        productsScreen();
        break;
    }
  }
}
