import 'package:dart_shop/screen.dart';

void program() {
  Screen screen = Screen();

  while (true) {
    print("\x1B[2J\x1B[0;0H");
    screen.showPage();
  }
}
