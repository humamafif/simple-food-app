import 'package:http/http.dart' as http;
import 'dart:convert';
import '/feature/meals/model/meal_model.dart';

class ApiService {
  Future<List<MealModel>> getMeals() async {
    List<MealModel> allMeals = [];
    List<String> alphabets = [
      'a',
      'b',
      'c',
      'd',
      'e',
      'f',
      'g',
      'h',
      'i',
      'j',
      'k',
      'l',
      'm',
      'n'
    ];

    for (String letter in alphabets) {
      final response = await http.get(Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/search.php?f=$letter'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> mealsData = data['meals'];

        if (mealsData.isNotEmpty) {
          allMeals.addAll(mealsData
              .map((mealJson) => MealModel.fromJson(mealJson))
              .toList());
        }
      } else {
        throw Exception('Failed to load meals for letter $letter');
      }
    }
    print('Total meals fetched: ${allMeals.length}');
    return allMeals;
  }
}
