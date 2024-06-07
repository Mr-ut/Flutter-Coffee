import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/components/coffee_tile.dart';
import 'package:flutter_test_application_1/models/coffee.dart';
import 'package:flutter_test_application_1/models/coffee_shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final user = FirebaseAuth.instance.currentUser;
  // add coffee to cart
  void addToCart(Coffee coffee) {
    // add to the cart
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    // let user know it is added successfully
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title:
            Text("Successfully added to cart", style: TextStyle(fontSize: 18)),
      ),
    );
  }

  void signOut() async{
     FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<CoffeeShop>(
          builder: (context, value, child) => SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      // heading
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "How would you like your coffee?${user!.email}",
                            style: TextStyle(fontSize: 20),
                          ),
                          GestureDetector(onTap: signOut,child: Text('Logout')),
                        ],
                      ),
      
                      const SizedBox(height: 25),
      
                      // list of coffee to buy
                      Expanded(
                        child: ListView.builder(
                            itemCount: value.coffeeShop.length,
                            itemBuilder: (context, index) {
                              // get indivisual coffee
                              Coffee eachCoffee = value.coffeeShop[index];
      
                              // return the tile for each coffee
                              return CoffeeTile(
                                coffee: eachCoffee,
                                icon: Icon(Icons.add),
                                onPressed: () => addToCart(eachCoffee),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
