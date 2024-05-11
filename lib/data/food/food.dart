import 'package:project_1/domain/food/ifood.dart';

class Food implements IFood {
  @override
  String area;

  @override
  String title;

  @override
  String picture;

  @override
  String instructions;

  @override
  String category;

  @override
  List<String> ingredients;

  @override
  String youtubeVideo;

  Food(
      {required this.title,
      required this.area,
      required this.picture,
      required this.category,
      required this.youtubeVideo,
      required this.instructions,
      required this.ingredients});

  factory Food.fromJson({required Map<String, dynamic> data}) {
    List<String> ingredients = [];
    data.forEach((key, value) {
      if (key.startsWith("strIngredient") &&
          value != null &&
          value.toString().isNotEmpty) {
        ingredients.add(value.toString());
      }
    });
    return Food(
        area: data["strArea"],
        title: data["strMeal"],
        picture: data["strMealThumb"],
        category: data["strCategory"],
        youtubeVideo: data["strYoutube"],
        instructions: data["strInstructions"],
        ingredients: ingredients);
  }
}
