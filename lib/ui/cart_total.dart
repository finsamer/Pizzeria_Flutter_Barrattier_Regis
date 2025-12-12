import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:pizeria/models/cart.dart';
import 'package:pizeria/ui/share/pizzeria_style.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var format = NumberFormat.currency(locale: 'fr_FR', symbol: '€');

    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Consumer<Cart>(
        builder: (context, cart, child) {
          if (cart.totalItems() == 0) {
            return Center(
              child: Text('Aucun produit', style: PizzeriaStyle.priceTotalTextStyle),
            );
          } else {
            return Column(
              children: [
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(1),
                  },
                  children: [
                    TableRow(
                      children: [
                        const Text('TOTAL HT', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(format.format(cart.totalHT), textAlign: TextAlign.right),
                      ],
                    ),
                    TableRow(
                      children: [
                        const Text('TVA'),
                        Text(format.format(cart.tva), textAlign: TextAlign.right),
                      ],
                    ),
                    TableRow(
                      children: [
                        const Text('TOTAL TTC', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(format.format(cart.totalTTC), textAlign: TextAlign.right),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      print('Valider le panier');
                    },
                    child: const Text('VALIDER LE PANIER', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
