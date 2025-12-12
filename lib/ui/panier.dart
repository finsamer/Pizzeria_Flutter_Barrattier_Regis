import 'package:flutter/material.dart';
import 'package:pizeria/ui/cart_list.dart';
import 'package:pizeria/ui/cart_total.dart';
import 'package:pizeria/ui/share/bottom_navigation_bar_widget.dart';

class Panier extends StatelessWidget {
  const Panier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon panier'),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CartList(),
            ),
          ),
          const CartTotal(),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(indexSelected: 2),
    );
  }
}
