import 'package:flutter/material.dart';
import '/core/color_constant.dart';
import '/feature/meals/model/meal_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.mealModel,
  });
  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          mealModel.title,
          style: const TextStyle(
              color: black, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(mealModel.gambar),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    mealModel.category,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Divider(),
              const Text(
                "Instructions",
                style: TextStyle(
                  fontSize: 14,
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                mealModel.keterangan,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 14,
                  color: black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
