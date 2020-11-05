import 'package:breaking_bad/widgets/centered_message.dart';
import 'package:breaking_bad/widgets/circular_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final String imagePath;
  final Function onTap;

  const CharacterCard({
    this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: CachedNetworkImage(
          imageUrl: imagePath,
          placeholder: (context, url) => CircularLoading(
            valueColor: new AlwaysStoppedAnimation(Colors.green[900]),
          ),
          errorWidget: (context, url, error) => CenteredMessage(
            icon: Icons.error,
            message: 'There was an error while loading the image',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
