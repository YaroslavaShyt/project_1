import 'package:project_1/domain/food/ifood.dart';

abstract interface class IFoodRepository{
  Future<List<IFood>> getAllFood();
  Future<IFood?> getFoodDetailes();
}