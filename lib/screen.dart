import 'dart:io';

import 'package:chalkdart/chalkstrings.dart';
import 'package:dart_shop/exception/custom_exception.dart';
import 'package:dart_shop/shopping_mall.dart';

class Screen {
  String page = "HOME";
  final ShoppingMall mall = ShoppingMall();

  void exitProgram() {
    print("이용해 주셔서 감사합니다~ 안녕히 가세요!");
    exit(0);
  }

  void homeScreen() {
    print("------------------------------------------------------------");
    print("1. 상품 목록 보기".red);
    print("2. 장바구니에 상품 추가".green);
    print("3. 장바구니에 담긴 상품의 총 가격".blue);
    print("4. 장바구니에 담긴 상품 목록 보기".yellow);
    print("0. 종료".white.bold);
    print("------------------------------------------------------------");

    // 입력 받는 코드
    stdout.write("입력> ");
    String? input = stdin.readLineSync();

    if (input == "0") {
      exitProgram();
    } else if (input == "1") {
      page = "PRODUCTS";
    } else if (input == "2") {
      page = "ADD";
    } else if (input == "3") {
      page = "TOTAL";
    } else if (input == "4") {
      page = "CART";
    } else {
      throw CustomException(this.page);
    }
  }

  void productsScreen() {
    print("------------------------------------------------------------");
    print("상품 목록".bold.ghostWhite);
    print("------------------------------------------------------------");
    mall.showProducts();
    print("============================================================");
    print("-1. 뒤로가기".gray.bold);
    print("0. 종료".white.bold);
    print("------------------------------------------------------------");

    // 입력 받는 코드
    stdout.write("입력> ");
    String? input = stdin.readLineSync();

    if (input == "-1") {
      page = "HOME";
    } else if (input == "0") {
      exitProgram();
    } else if (input == "1") {
      page = "ADD";
    } else {
      throw CustomException(this.page);
    }
  }

  void addScreen() {
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
      page = "HOME";
      return;
    } else if (name == "0") {
      exitProgram();
    }

    // 상품명 조건 체크
    if (name == "" || name == null) {
      throw CustomException(this.page, "상품 이름을 입력해주세요.");
    } else if (!mall.products.any((product) => product.name == name)) {
      throw CustomException(this.page, "입력값이 올바르지 않아요 !");
    }

    stdout.write("추가할 상품 개수 입력> ");
    String? count = stdin.readLineSync();

    if (count == "-1") {
      page = "HOME";
      return;
    } else if (name == "0") {
      exitProgram();
    }

    // 상품 개수 조건 체크
    if (count == "" || count == null) {
      throw CustomException(this.page, "상품 개수를 입력해주세요.");
    } else if (int.tryParse(count) == null) {
      throw CustomException(this.page, "입력값이 올바르지 않아요 !");
    } else if (int.parse(count) <= 0) {
      throw CustomException(this.page, "0개보다 많은 개수의 상품만 담을 수 있어요 !");
    }

    // 상품 장바구니로 추가
    mall.addToCart(name, int.parse(count));
    page = "HOME";
  }

  void totalScreen() {
    print("------------------------------------------------------------");
    print("장바구니에 담긴 상품의 총 가격".bold.ghostWhite);
    print("------------------------------------------------------------");
    mall.showTotal();
    print("============================================================");
    print("-1. 뒤로가기".gray.bold);
    print("0. 종료".white.bold);
    print("------------------------------------------------------------");
    stdout.write("입력> ");
    String? input = stdin.readLineSync();

    if (input == "-1") {
      page = "HOME";
    } else if (input == "0") {
      exitProgram();
    } else {
      throw CustomException(this.page);
    }
  }

  void cartScreen() {
    print("------------------------------------------------------------");
    print("장바구니 상품 목록".bold.ghostWhite);
    print("------------------------------------------------------------");
    mall.showCart();
    print("============================================================");
    print("뒤로가기: -1, 종료: 0");
    stdout.write("입력> ");
    String? input = stdin.readLineSync();

    if (input == "-1") {
      page = "HOME";
    } else if (input == "0") {
      exitProgram();
    } else {
      throw CustomException(this.page);
    }
  }

  void showError(String page, String message) {
    print("${"\x1B[2J\x1B[0;0H"}");
    print("------------------------------------------------------------");
    print(message.red.bold);
    print("------------------------------------------------------------");
    print("뒤로가기: -1, 종료: 0");
    stdout.write("입력> ");
    String? input = stdin.readLineSync();

    if (input == "-1") {
      this.page = page;
    } else if (input == "0") {
      exitProgram();
    }
  }

  void showPage() {
    try {
      switch (page) {
        case "HOME":
          homeScreen();
          break;
        case "PRODUCTS":
          productsScreen();
          break;
        case "ADD":
          addScreen();
          break;
        case "TOTAL":
          totalScreen();
          break;
        case "CART":
          cartScreen();
          break;
      }
    } on CustomException catch (e) {
      showError(e.page, e.message);
    }
  }
}
