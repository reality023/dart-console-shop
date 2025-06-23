import 'package:dart_shop/product.dart';

class ShoppingMall {
  List<Product> products = [];
  List<Product> cart = [];
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

  void showProducts() {
    print("상품 목록");
    for (var product in products) {
      print("${product.name} - ${product.price}원");
    }
  }

  void addToCart() {}

  void showTotal() {}

  void exit() {}
}
