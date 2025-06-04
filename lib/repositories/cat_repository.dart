import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cat_model.dart';

class CatRepository {
  final String _baseUrl = 'https://api.thecatapi.com/v1';
  
  Future<Cat> fetchRandomCat() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/images/search?has_breeds=1'),
      headers: {'x-api-key': 'live_Kf9mXhXnqd05Dyjk11mUq5eNoWgHyXw4YtEqIfwbPuGTfSjsUaNEEQ4s0TfPXiBe'}, // Замените на ваш API ключ
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return Cat.fromJson(data[0]);
    } else {
      throw Exception('Failed to load cat');
    }
  }
}