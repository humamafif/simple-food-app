class MealModel {
  final String title, keterangan, category, gambar;

  MealModel({
    required this.title,
    required this.keterangan,
    required this.category,
    required this.gambar,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      title: json["strMeal"],
      keterangan: json["strInstructions"],
      category: json["strCategory"],
      gambar: json["strMealThumb"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "strMeal": title,
      "strInstructions": keterangan,
      "strCategory": category,
      "strMealThumb": gambar,
    };
  }
}
