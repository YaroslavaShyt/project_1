import 'package:project_1/app/common/base_change_notifier.dart';
import 'package:project_1/app/routing/routes.dart';
import 'package:project_1/app/services/local_storage/keys.dart';
import 'package:project_1/app/services/theming/theme_provider.dart';
import 'package:project_1/app/services/user/user_service.dart';
import 'package:project_1/domain/food/ifood.dart';
import 'package:project_1/domain/food/ifood_repository.dart';
import 'package:project_1/domain/local_storage/ilocal_storage.dart';
import 'package:project_1/domain/navigation/inavigation_util.dart';

class FoodViewModel extends BaseChangeNotifier {
  final ILocalStorage _storage;
  final IFoodRepository _foodRepository;
  final INavigationUtil _navigationUtil;
  final ThemeProvider _themeProvider;

  List<IFood> _foodList = [];

  FoodViewModel(
      {required IFoodRepository foodRepository,
      required ILocalStorage localStorage,
      required UserService userService,
      required ThemeProvider themeProvider,
      required INavigationUtil navigationUtil})
      : _foodRepository = foodRepository,
        _storage = localStorage,
        _themeProvider = themeProvider,
        _navigationUtil = navigationUtil;

  List<IFood> get foodList => _foodList;

  Future<void> fetchFoodDataList() async {
    foodList.clear();
    setIsDataLoading(true);
    try {
      _foodList = await _foodRepository.getAllFood();
      setIsDataLoaded(true);
    } catch (error) {
      setIsDataLoaded(false);
    } finally {
      setIsDataLoading(false);
    }
  }

  Function() get swapTheme => _themeProvider.swapTheme;

  void navigateToFoodDetails({required IFood food}) {
    _navigationUtil.navigateTo(routeDetails, data: food);
  }

  Future<IFood?> fetchFoodDetailes({required String foodID}) async {
    setIsDataLoading(true);
    try {
      IFood? foodDish = await _foodRepository.getFoodDetailes(foodID: foodID);
      setIsDataLoaded(true);
      return foodDish;
    } catch (error) {
      setIsDataLoaded(false);
      return null;
    } finally {
      setIsDataLoading(false);
    }
  }

  void onLogOutButtonPressed() {
    _storage.delete(keyEmail);
    _storage.delete(keyPassword);

    _navigationUtil.navigateToAndReplace(routeLogin);
  }
}
