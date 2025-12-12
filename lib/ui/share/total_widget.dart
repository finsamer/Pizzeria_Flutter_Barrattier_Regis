import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TotalWidget extends StatelessWidget {
  final double total;
  const TotalWidget({required this.total, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var format = NumberFormat.currency(locale: 'fr_FR', symbol: '€');

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          const Text('TOTAL', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const Spacer(),
          Text(format.format(total), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ],
      ),
    );
  }
}
