import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pizeria/models/cart.dart';
import 'package:pizeria/ui/panier.dart';
import 'package:pizeria/ui/share/bottom_navigation_bar_widget.dart';
import 'models/menu.dart';
import 'ui/pizza_list.dart';
import 'ui/profil.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizzeria',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Notre pizzeria'),
        '/pizzas': (context) => const PizzaList(),
        '/panier': (context) => const Panier(),
        '/profil': (context) => const ProfilPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: Menu.menus.length,
        itemBuilder: (context, index) {
          return _buildRow(context, Menu.menus[index]);
        },
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(indexSelected: 0),
    );
  }

  Widget _buildRow(BuildContext context, Menu menu) {
    return InkWell(
      onTap: () {
        if (menu.type == 2) { // Pizza
          Navigator.pushNamed(context, '/pizzas');
        }
      },
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: menu.color,
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        ),
        margin: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/menus/${menu.image}',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              menu.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
