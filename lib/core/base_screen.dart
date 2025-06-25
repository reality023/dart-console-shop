import 'dart:io';
import 'package:chalkdart/chalkstrings.dart';
import 'package:dart_shop/core/app_state.dart';

abstract class BaseScreen {
  String title = "";
  AppState appState = AppState();

  BaseScreen({required this.title});

  void drawSingleLine() {
    print("------------------------------------------------------------");
  }

  void drawDoubleLine() {
    print("============================================================");
  }

  void exitConfirm() {
    print("프로그램을 종료하시겠습니까? (Y/N)".bold.white);
    String? input = stdin.readLineSync();

    if (input == "Y") {
      exit(0);
    }
  }

  void errorAlert(String message) {
    clearScreen();
    print("------------------------------------------------------------");
    print(message.bold.red);
    print("------------------------------------------------------------");

    stdout.write("ENTER>");
    stdin.readLineSync();
  }

  void successAlert(String message) {
    clearScreen();
    print("------------------------------------------------------------");
    print(message.bold.green);
    print("------------------------------------------------------------");

    stdout.write("ENTER>");
    stdin.readLineSync();
  }

  void clearScreen() {
    print("${"\x1B[2J\x1B[0;0H"}");
  }

  void show();
}
