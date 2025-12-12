import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pizeria/models/cart.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int indexSelected;

  const BottomNavigationBarWidget({required this.indexSelected, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();
    var totalItems = cart.totalItems();

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: indexSelected,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Accueil',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.add_shopping_cart_outlined),
          label: 'Commande',
        ),
        BottomNavigationBarItem(
          icon: totalItems == 0
              ? const Icon(Icons.shopping_cart_outlined)
              : Badge(
                  child: const Icon(Icons.shopping_cart),
                  label: Text(totalItems.toString()),
                ),
          label: 'Panier',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
      onTap: (index) {
        String page = '/';
        switch (index) {
          case 2:
            page = '/panier';
            break;
          case 3:
            page = '/profil';
            break;
        }
        Navigator.pushNamed(context, page);
      },
    );
  }
}
