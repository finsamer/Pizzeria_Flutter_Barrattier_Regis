import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:pizeria/models/cart.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();
    var format = NumberFormat.currency(locale: 'fr_FR', symbol: '€');

    return ListView.builder(
      itemCount: cart.totalItems(),
      itemBuilder: (context, index) {
        final cartItem = cart.getCartItem(index);
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.network(
                  cartItem.pizza.image.replaceAll('http://localhost', 'http://10.0.2.2/PIZERIA'),
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.pizza.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text('${format.format(cartItem.pizza.price)} x ${cartItem.quantity}'),
                      Text(
                        'Sous-total: ${format.format(cartItem.pizza.total * cartItem.quantity)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero, // Corrige l'overflow
                      constraints: const BoxConstraints(), // Corrige l'overflow
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        cart.decrementQuantity(index);
                      },
                    ),
                    Text(cartItem.quantity.toString()),
                    IconButton(
                      padding: EdgeInsets.zero, // Corrige l'overflow
                      constraints: const BoxConstraints(), // Corrige l'overflow
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        cart.incrementQuantity(index);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
