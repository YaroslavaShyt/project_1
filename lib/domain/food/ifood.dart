abstract interface class IFood {
  String title;
  String area;
  String picture;
  String instructions;
  String category;
  String youtubeVideo;
  List<String> ingredients;

  IFood(
      {required this.title,
      required this.area,
      required this.picture,
      required this.category,
      required this.youtubeVideo,
      required this.instructions,
      required this.ingredients});
}
