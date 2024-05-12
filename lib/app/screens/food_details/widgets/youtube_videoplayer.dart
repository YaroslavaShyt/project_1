import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' as mobile;
import 'package:youtube_player_iframe/youtube_player_iframe.dart' as web;

class YoutubeVideoPlayer extends StatefulWidget {
  final controller;
  final String? videoId;
  const YoutubeVideoPlayer({super.key, required this.controller, this.videoId});

  @override
  State<YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      widget.controller.loadVideoById(videoId: widget.videoId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? web.YoutubePlayer(
            controller: widget.controller,
          )
        : mobile.YoutubePlayer(
            controller: widget.controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.amber,
            progressColors: const mobile.ProgressBarColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),
          );
  }
}
