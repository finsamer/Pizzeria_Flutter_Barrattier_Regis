import 'package:flutter/material.dart';

class Menu {
  int type;
  String title;
  String image;
  Color color;

  static final List<Menu> menus = [
    Menu(1, 'Entrees', 'entree.png', Colors.lightGreen),
    Menu(2, 'Pizzas', 'pizza.png', Colors.redAccent),
    Menu(3, 'Desserts', 'dessert.png', Colors.brown),
    Menu(4, 'Boissons', 'boisson.png', Colors.lightBlue)
  ];

  Menu(this.type, this.title, this.image, this.color);
}