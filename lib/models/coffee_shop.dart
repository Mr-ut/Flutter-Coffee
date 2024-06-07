import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/models/coffee.dart';

class CoffeeShop extends ChangeNotifier {
  // coffee for sale list
  final List<Coffee> _shop = [
    // black coffee
    Coffee(
        name: 'Long Black', price: '4.10', imagePath: 'lib/images/coffee.png'),

    // latte
    Coffee(name: 'Latte', price: '6.30', imagePath: 'lib/images/latte.png'),

    // expresso
    Coffee(
        name: 'Expresso', price: '7,23', imagePath: 'lib/images/expresso.png'),

    // cold coffee
    Coffee(
        name: 'Cold Coffee',
        price: '6.30',
        imagePath: 'lib/images/cold-coffee.png')
  ];

  // user cart
  List<Coffee> _userCart = [];

  // get coffee list
  List<Coffee> get coffeeShop => _shop;

  // get user cart
  List<Coffee> get userCart => _userCart;

  // adding item to the cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // removing item from the cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
