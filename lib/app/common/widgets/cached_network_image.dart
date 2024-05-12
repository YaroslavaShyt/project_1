import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MainCachedNetworkImage extends StatelessWidget {
  final String url;
  const MainCachedNetworkImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => SizedBox(
              child: CircularProgressIndicator(
                color: Theme.of(context).canvasColor,
              ),
            ),
        errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.amber,
            ));
  }
}
