import 'package:flutter/material.dart';
import '/core/color_constant.dart';
import '/pages/home/header.dart';
import '/feature/meals/services/api_service.dart';
import '/feature/meals/model/meal_model.dart';
import '/feature/meals/presentation/meal/recom_meal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MealModel> dataMeal = [];
  int mealCount = 0;
  late ApiService apiService;

  Future initialize() async {
    dataMeal = await apiService.getMeals();
    setState(() {
      mealCount = dataMeal.length;
      dataMeal = dataMeal;
    });
  }

  @override
  void initState() {
    apiService = ApiService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        title: const Text(
          "Ayo Makan!",
          style: TextStyle(
              color: black, fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              dataMeal: dataMeal,
            ),
            SizedBox(
              height: 500,
              child: RecomMeal(
                dataMeal: dataMeal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
