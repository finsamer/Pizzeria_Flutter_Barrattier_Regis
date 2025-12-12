import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pizeria/models/cart.dart';
import 'package:pizeria/models/pizza.dart';

class BuyButtonWidget extends StatelessWidget {
  final Pizza pizza;

  const BuyButtonWidget({required this.pizza, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtention de l'objet cart depuis le provider sans écouter les changements
    var cart = context.read<Cart>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.red.shade800),
          ),
          onPressed: () {
            print('Commander une pizza');
            cart.addProduct(pizza);
          },
          child: Row(
            children: const [
              Icon(Icons.shopping_cart),
              SizedBox(width: 5),
              Text("Commander"),
            ],
          ),
        ),
      ],
    );
  }
}
