import 'dart:convert';

import 'package:family_recipes_app/models/recipe.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RequestData {
  Future<List<Recipe>> getRecipes() async {
    final String apiUrl = dotenv.env['API_URL'] ?? '';
    final String apiVersion = dotenv.env['API_VERSION'] ?? '';
    final String url = "$apiUrl/$apiVersion/recipes/";
    print(url);
    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    });

    if (response.statusCode == 200) {
      return parseRecipes(response.body);
    } else {
      throw Exception('Erro HTTP ${response.statusCode}');
    }
  }
}

List<Recipe> parseRecipes(String responseBody) {
  var responseData = json.decode(responseBody);

  List<dynamic> recipesJson;

  if (responseData is List) {
    recipesJson = responseData;
  } else if (responseData is Map<String, dynamic>) {
    if (responseData.containsKey('data')) {
      recipesJson = responseData['data'] as List<dynamic>;
    } else if (responseData.containsKey('results')) {
      recipesJson = responseData['results'] as List<dynamic>;
    } else if (responseData.containsKey('recipes')) {
      recipesJson = responseData['recipes'] as List<dynamic>;
    } else {
      recipesJson = [responseData];
    }
  } else {
    throw Exception('Formato de resposta inesperado');
  }

  return recipesJson.map<Recipe>((json) => Recipe.fromJson(json)).toList();
}
