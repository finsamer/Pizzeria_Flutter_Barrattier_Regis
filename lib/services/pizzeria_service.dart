import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pizeria/models/pizza.dart';

class PizzeriaService {
  // URI de base pour l'appel, incluant le nom du projet
  static const String url = "http://10.0.2.2/PIZERIA/api/";

  Future<List<Pizza>> fetchPizzas() async {
    List<Pizza> list = [];
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Décodage des accents (utf8) puis du JSON
        var json = jsonDecode(utf8.decode(response.bodyBytes));
        for (final value in json) {
          list.add(Pizza.fromJson(value));
        }
      } else {
        throw Exception('Impossible de récupérer les pizzas');
      }
    } catch (e) {
      throw Exception('Erreur de connexion: $e');
    }
    return list;
  }
}
