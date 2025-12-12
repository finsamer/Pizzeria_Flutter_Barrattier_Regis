import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pizeria/models/cart.dart';
import 'package:pizeria/ui/share/badge_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWidget({required this.title, Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();

    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/panier');
          },
          icon: BadgeWidget(
            value: cart.totalItems(),
            child: const Icon(Icons.shopping_cart),
          ),
        )
      ],
    );
  }
}
