import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_1/app/common/widgets/cached_network_image.dart';
import 'package:project_1/app/screens/food_details/food_details_view_model.dart';
import 'package:project_1/app/screens/food_details/widgets/category_header.dart';
import 'package:project_1/app/screens/food_details/widgets/cuisine_label.dart';
import 'package:project_1/app/screens/food_details/widgets/indicators.dart';
import 'package:project_1/app/screens/food_details/widgets/ingredient_card.dart';
import 'package:project_1/app/screens/food_details/widgets/youtube_videoplayer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' as mobile;
import 'package:youtube_player_iframe/youtube_player_iframe.dart' as web;

class FoodDetailsScreen extends StatefulWidget {
  final FoodDetailsViewModel viewModel;
  const FoodDetailsScreen({super.key, required this.viewModel});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  late List<Widget> mediaContent;
  int _currentIndex = 0;
  late var _controller;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _controller = web.YoutubePlayerController();
    } else {
      _controller = mobile.YoutubePlayerController(
          initialVideoId: widget.viewModel.videoId ?? '');
    }
    mediaContent = [
      Hero(
        tag: widget.viewModel.food.title,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: MainCachedNetworkImage(
              url: widget.viewModel.food.picture,
            )),
      ),
      if (widget.viewModel.videoId != null)
        ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: YoutubeVideoPlayer(
              controller: _controller,
              videoId: widget.viewModel.videoId,
            ))
    ];
  }

  @override
  void didUpdateWidget(covariant FoodDetailsScreen oldWidget) {
    _controller.pause();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (kIsWeb) {
      _controller.close();
    } else {
      _controller.dispose();
    }

    super.dispose();
  }

  void _onIndicatorsTap() {
    setState(() {
      _currentIndex == 0 ? _currentIndex = 1 : _currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.viewModel.food.title),
        actions: [CuisineLabel(label: widget.viewModel.food.area)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
                height: 350,
                width: MediaQuery.of(context).size.width - 20,
                child: mediaContent[_currentIndex]),
            const SizedBox(
              height: 10.0,
            ),
            Indicators(
              onTap: _onIndicatorsTap,
              current: _currentIndex,
            ),
            const CategoryHeader(title: "Ingredients"),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.viewModel.food.ingredients.length,
                  itemBuilder: (context, index) {
                    return IngredientCard(
                        name: widget.viewModel.food.ingredients[index]);
                  }),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const CategoryHeader(title: "Instructions"),
            const SizedBox(
              height: 10.0,
            ),
            Wrap(
              children: [
                Text(
                  widget.viewModel.food.instructions,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
