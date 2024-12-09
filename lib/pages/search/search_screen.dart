import 'package:flutter/material.dart';
import '/core/color_constant.dart';
import '/pages/search/search_result.dart';
import '/pages/search/search_widget.dart';
import '/feature/meals/services/api_service.dart';
import '/feature/meals/model/meal_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<MealModel> mealFilter = [];
  List<MealModel> dataMeal = [];
  int mealCount = 0;
  TextEditingController searchController = TextEditingController();
  ApiService apiService = ApiService();

  Future initialize() async {
    dataMeal = await apiService.getMeals();
    setState(() {
      mealCount = dataMeal.length;
      mealFilter = dataMeal;
    });
  }

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    initialize();
  }

  void _searchMeal(String query) {
    final filteredList = dataMeal.where((meal) {
      final title = meal.title.toLowerCase();
      final searchLower = query.toLowerCase();

      return title.contains(searchLower);
    }).toList();

    setState(() {
      mealFilter = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            "Makan apa ya?",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            SearchWidget(
              searchController: searchController,
              onSearchChanged: _searchMeal,
            ),
            const SizedBox(height: 10),
            SearchResult(
              mealFilter: mealFilter,
            ),
          ],
        ),
      ),
    );
  }
}
