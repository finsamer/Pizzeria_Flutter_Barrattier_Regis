import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pizeria/models/cart.dart';
import 'package:pizeria/services/pizzeria_service.dart';
import 'package:pizeria/ui/pizza_details.dart';
import 'package:pizeria/ui/share/appbar_widget.dart';
import 'package:pizeria/ui/share/bottom_navigation_bar_widget.dart';
import 'package:pizeria/ui/share/buy_button_widget.dart';
import 'package:pizeria/ui/share/pizzeria_style.dart';
import '../models/pizza.dart';

class PizzaList extends StatefulWidget {
  const PizzaList({Key? key}) : super(key: key);

  @override
  State<PizzaList> createState() => _PizzaListState();
}

class _PizzaListState extends State<PizzaList> {
  late Future<List<Pizza>> _pizzas;
  final PizzeriaService _service = PizzeriaService();

  @override
  void initState() {
    super.initState();
    _pizzas = _service.fetchPizzas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Nos Pizzas'),
      body: FutureBuilder<List<Pizza>>(
        future: _pizzas,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildListView(snapshot.data!);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Impossible de récupérer les données : ${snapshot.error}',
                style: PizzeriaStyle.errorTextStyle,
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(indexSelected: 1),
    );
  }

  Widget _buildListView(List<Pizza> pizzas) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: pizzas.length,
      itemBuilder: (context, index) {
        return _buildRow(context, pizzas[index]);
      },
    );
  }

  Widget _buildRow(BuildContext context, Pizza pizza) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10.0),
          top: Radius.circular(2.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PizzaDetails(pizza: pizza),
                ),
              );
            },
            child: _buildPizzaDetails(context, pizza),
          ),
          BuyButtonWidget(pizza: pizza),
        ],
      ),
    );
  }

  Widget _buildPizzaDetails(BuildContext context, Pizza pizza) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(pizza.title),
          subtitle: Text(pizza.garniture),
          leading: const Icon(Icons.local_pizza),
        ),
        Image.network(
          pizza.image.replaceAll('http://localhost', 'http://10.0.2.2/PIZERIA'),
          height: 120,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.all(4.0),
          child: Text(pizza.garniture),
        ),
      ],
    );
  }
}
