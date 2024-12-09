import 'package:flutter/material.dart';
import '/core/color_constant.dart';
import '/feature/meals/model/meal_model.dart';
import '/feature/meals/presentation/details/detail_page.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, required this.mealFilter});
  final List<MealModel> mealFilter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: mealFilter.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: mealFilter.length,
              itemBuilder: (context, index) {
                final MealModel meal = mealFilter[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          mealModel: meal,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(meal.gambar),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                meal.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: const TextStyle(
                                  color: black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                meal.category,
                                style: const TextStyle(
                                  color: black,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
