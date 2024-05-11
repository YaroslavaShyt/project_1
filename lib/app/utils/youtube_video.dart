import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoUtil {
  String? extractVideoId(String url) {
    String? videoId = YoutubePlayer.convertUrlToId(url);
    return videoId;
  }
}
