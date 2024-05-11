import 'package:flutter/material.dart';
import 'package:project_1/app/screens/food_details/food_details_view_model.dart';
import 'package:project_1/app/screens/food_details/widgets/indicators.dart';
import 'package:project_1/app/screens/food_details/widgets/youtube_videoplayer.dart';
import 'package:project_1/app/services/networking/endpoints.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FoodDetailsScreen extends StatefulWidget {
  final FoodDetailsViewModel viewModel;
  const FoodDetailsScreen({super.key, required this.viewModel});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  late List<Widget> mediaContent;
  int _currentIndex = 0;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        YoutubePlayerController(initialVideoId: widget.viewModel.videoId ?? '');
    mediaContent = [
      Hero(
        tag: widget.viewModel.food.title,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.network(widget.viewModel.food.picture)),
      ),
      if (widget.viewModel.videoId != null)
        ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: YoutubeVideoPlayer(
              controller: _controller,
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
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.viewModel.food.title),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
                margin: const EdgeInsets.only(right: 10.0),
                padding: const EdgeInsets.all(10.0),
                color: Theme.of(context).canvasColor,
                child: Text(
                  widget.viewModel.food.area,
                  style: TextStyle(color: Theme.of(context).primaryColorLight),
                )),
          ),
        ],
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
              onTap: () {
                setState(() {
                  if (_currentIndex == 0) {
                    _currentIndex = 1;
                  } else {
                    _currentIndex = 0;
                  }
                });
              },
              current: _currentIndex,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Ingredients",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.viewModel.food.ingredients.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      padding: const EdgeInsets.all(8.0),
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Theme.of(context).canvasColor),
                      child: Center(
                        child: Column(
                          children: [
                            Image.network(
                                "$urlIngredients${widget.viewModel.food.ingredients[index]}-Small.png"),
                            Wrap(children: [
                              Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                widget.viewModel.food.ingredients[index],
                                style: TextStyle(
                                    color: Theme.of(context).primaryColorLight,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.5),
                              ),
                            ])
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Instructions",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
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
