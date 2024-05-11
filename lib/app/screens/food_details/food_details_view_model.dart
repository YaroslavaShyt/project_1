import 'package:project_1/app/common/base_change_notifier.dart';
import 'package:project_1/app/utils/youtube_video.dart';
import 'package:project_1/domain/food/ifood.dart';

class FoodDetailsViewModel extends BaseChangeNotifier {
  final IFood food;
  String? videoId;
  final YoutubeVideoUtil _youtubeVideoUtil;

  FoodDetailsViewModel(
      {required this.food, required YoutubeVideoUtil youtubeVideoUtil})
      : _youtubeVideoUtil = youtubeVideoUtil{
        videoId = _youtubeVideoUtil.extractVideoId(food.youtubeVideo);
      }

}
