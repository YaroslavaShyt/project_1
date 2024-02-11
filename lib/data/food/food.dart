import 'package:project_1/domain/food/ifood.dart';

class Food implements IFood {
  @override
  String area;

  @override
  String title;

  @override
  String picture;

  Food({required this.title, required this.area, required this.picture});

  factory Food.fromJson({required Map<String, dynamic> data}) {
    return Food(
        area: data["strArea"],
        title: data["strMeal"],
        picture: data["strMealThumb"]);
  }
}
