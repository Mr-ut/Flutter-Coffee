import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/components/coffee_tile.dart';
import 'package:flutter_test_application_1/models/coffee.dart';
import 'package:flutter_test_application_1/models/coffee_shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove item from cart
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  // pay button
  void payNow(){
    // handel payment logic
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    // heading
                    const Text(
                      'Your Cart',
                      style: TextStyle(fontSize: 20),
                    ),

                    // list of all cart items
                    Expanded(
                      child: ListView.builder(
                        itemCount: value.userCart.length,
                        itemBuilder: (context, index) {
                        // get indivisiual cart item
                        Coffee eachCoffee = value.userCart[index];

                        // return coffee tile
                        return CoffeeTile(
                            coffee: eachCoffee,
                            onPressed: () => removeFromCart(eachCoffee),
                            icon: Icon(Icons.delete));
                      }),
                    ),

                    // pay button
                    GestureDetector(
                      onTap: payNow,
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.brown, 
                          borderRadius: BorderRadius.circular(12)
                          ),
                        child: const Center(
                          child: Text("Pay Now", 
                          style: TextStyle(color: Colors.white),
                          ),
                          ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
