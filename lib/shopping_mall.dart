import 'package:dart_shop/model/cart_product.dart';
import 'package:dart_shop/model/product.dart';
import 'package:intl/intl.dart';

class ShoppingMall {
  List<Product> products = [];
  Map<String, CartProduct> cart = {};
  int total = 0;

  ShoppingMall() {
    products.addAll([
      Product(name: "셔츠", price: 1000),
      Product(name: "원피스", price: 2000),
      Product(name: "반팔티", price: 3000),
      Product(name: "청바지", price: 4000),
      Product(name: "면바지", price: 5000),
      Product(name: "목도리", price: 6000),
      Product(name: "모자", price: 7000),
      Product(name: "신발", price: 8000),
      Product(name: "가방", price: 9000),
    ]);
  }

  void clearCart() {
    cart.clear();
    total = 0;
  }

  void showProducts() {
    for (var product in products) {
      print(
          "${product.name} - [${NumberFormat("###,###").format(product.price)}]");
    }
  }

  void showCart() {
    for (var product in cart.values) {
      print(
          "${product.name} - [${NumberFormat("###,###").format(product.price)}] x ${product.count}");
    }
    print("============================================================");
    print("총 가격: ${NumberFormat("###,###").format(total)}원");
  }

  void addToCart(String name, int count) {
    try {
      // firstWhere: 조건에 맞는 첫 번째 요소를 반환 / 없을 경우 에러 발생
      Product product = products.firstWhere(
        (product) => product.name == name,
      );

      // 상품 개수만큼 반복하면서 장바구니에 추가
      for (int i = 0; i < count; i++) {
        if (cart.containsKey(product.name)) {
          cart[product.name]!.count += 1;
          total += product.price;
        } else {
          cart.addAll({
            product.name: CartProduct(
              name: product.name,
              price: product.price,
              count: 1,
            ),
          });
          total += product.price;
        }
      }
    } catch (e) {
      print("상품을 찾을 수 없습니다.");
    }
  }

  void showTotal() {
    print("총 가격: ${NumberFormat("###,###").format(total)}원");
  }

  void exit() {}
}
