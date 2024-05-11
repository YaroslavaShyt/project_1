import 'package:flutter/material.dart';
import 'package:project_1/app/screens/food_details/food_details_screen.dart';
import 'package:project_1/app/screens/food_details/food_details_view_model.dart';
import 'package:project_1/app/utils/youtube_video.dart';
import 'package:project_1/domain/food/ifood.dart';
import 'package:provider/provider.dart';

class FoodDetailsFactory {
  static Widget build({required IFood food}) {
    return ChangeNotifierProvider(
      create: (context) => FoodDetailsViewModel(
        youtubeVideoUtil: YoutubeVideoUtil(),
        food: food),
      child: Consumer<FoodDetailsViewModel>(builder: (context, model, child) {
        return FoodDetailsScreen(
          viewModel: model,
        );
      }),
    );
  }
}
