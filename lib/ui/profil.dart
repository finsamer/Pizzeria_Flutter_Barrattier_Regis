import 'package:flutter/material.dart';
import 'package:pizeria/ui/share/appbar_widget.dart';
import 'package:pizeria/ui/share/bottom_navigation_bar_widget.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Profil'),
      body: const Center(
        child: Text('Page de profil'),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(indexSelected: 3),
    );
  }
}
