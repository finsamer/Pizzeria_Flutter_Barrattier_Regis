import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pizeria/models/cart.dart';
import 'package:pizeria/models/option_item.dart';
import 'package:pizeria/ui/share/appbar_widget.dart';
import 'package:pizeria/ui/share/bottom_navigation_bar_widget.dart';
import 'package:pizeria/ui/share/buy_button_widget.dart';
import 'package:pizeria/ui/share/pizzeria_style.dart';
import 'package:pizeria/ui/share/total_widget.dart';
import '../models/pizza.dart';
import 'package:pizeria/services/pizzeria_service.dart';

class PizzaDetails extends StatefulWidget {
  final Pizza pizza;

  const PizzaDetails({required this.pizza, Key? key}) : super(key: key);

  @override
  State<PizzaDetails> createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: widget.pizza.title),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Pizza: ${widget.pizza.title}', style: PizzeriaStyle.pageTitleTextStyle),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Image.network(
                  widget.pizza.image.replaceAll('http://localhost', 'http://10.0.2.2/PIZERIA'),
                  width: constraints.maxWidth,
                );
              },
            ),
            const SizedBox(height: 8),
            Text('Recette', style: PizzeriaStyle.headerTextStyle),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
              child: Text(widget.pizza.garniture, style: PizzeriaStyle.regularTextStyle),
            ),
            Text('Pâte et taille sélectionnées', style: PizzeriaStyle.headerTextStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildDropdownPates()),
                Expanded(child: _buildDropdownTailles()),
              ],
            ),
            const SizedBox(height: 8),
            Text('Sauce sélectionnées', style: PizzeriaStyle.headerTextStyle),
            _buildDropdownSauces(),
            const SizedBox(height: 16),
            TotalWidget(total: widget.pizza.total),
            const SizedBox(height: 8),
            BuyButtonWidget(pizza: widget.pizza),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(indexSelected: 1),
    );
  }

  Widget _buildDropdownPates() {
    return DropdownButton<OptionItem>(
      value: Pizza.pates[widget.pizza.pate],
      items: _buildDropdownItems(Pizza.pates),
      isExpanded: true,
      onChanged: (item) {
        setState(() {
          widget.pizza.pate = item!.value;
        });
      },
    );
  }

  Widget _buildDropdownTailles() {
    return DropdownButton<OptionItem>(
      value: Pizza.tailles[widget.pizza.taille],
      items: _buildDropdownItems(Pizza.tailles),
      isExpanded: true,
      onChanged: (item) {
        setState(() {
          widget.pizza.taille = item!.value;
        });
      },
    );
  }

  Widget _buildDropdownSauces() {
    return DropdownButton<OptionItem>(
      value: Pizza.sauces[widget.pizza.sauce],
      items: _buildDropdownItems(Pizza.sauces),
      isExpanded: true,
      onChanged: (item) {
        setState(() {
          widget.pizza.sauce = item!.value;
        });
      },
    );
  }

  List<DropdownMenuItem<OptionItem>> _buildDropdownItems(List<OptionItem> list) {
    return list.map((item) {
      return DropdownMenuItem<OptionItem>(
        value: item,
        child: Text(item.name),
      );
    }).toList();
  }
}
