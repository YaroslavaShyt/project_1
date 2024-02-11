import 'package:project_1/app/services/networking/endpoints.dart';
import 'package:project_1/data/food/food.dart';
import 'package:project_1/domain/food/ifood.dart';
import 'package:project_1/domain/food/ifood_repository.dart';
import 'package:project_1/domain/networking/inetwork_service.dart';

class FoodRepository implements IFoodRepository {
  final INetworkService _networkService;

  FoodRepository({required INetworkService networkService})
      : _networkService = networkService;

  @override
  Future<List<IFood>> getAllFood() async {
    List<IFood> foodList = [];
    try {
      var response = await _networkService.get(endpoint: urlSearch);
      foodList = _parseResponse(response);
      return foodList;
    } catch (err) {
      return foodList;
    }
  }

  @override
  Future<IFood?> getFoodDetailes({required String foodID}) async {
    try {
      var response = await _networkService.get(endpoint: urlSearch+foodID);
      IFood food = _parseResponse(response).first;
      return food;
    } catch (err) {
      return null;
    }
  }

  List<IFood> _parseResponse(Map<String, dynamic> responseData) {
    List<IFood> data = [];
    if (responseData.containsKey("meals")) {
      List<dynamic> meals = responseData["meals"];
      data = meals.map((meal) => Food.fromJson(data: meal)).toList();
    }
    return data;
  }
}
