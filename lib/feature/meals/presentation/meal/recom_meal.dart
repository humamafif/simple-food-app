import 'package:flutter/material.dart';
import '/core/color_constant.dart';
import '/feature/meals/presentation/meal/list_meal.dart';

class RecomMeal extends StatefulWidget {
  const RecomMeal({super.key, required this.dataMeal});
  final List dataMeal;

  @override
  State<RecomMeal> createState() => _RecomMealState();
}

class _RecomMealState extends State<RecomMeal> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recommended for you",
            style: TextStyle(
              color: black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 8),
              height: MediaQuery.of(context).size.height / 2,
              child: ListMeals(
                listData: widget.dataMeal,
              )),
        ],
      ),
    );
  }
}
