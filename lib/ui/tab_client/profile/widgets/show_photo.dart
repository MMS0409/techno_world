import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../utils/shimmer_photo.dart';

class ShowPhoto extends StatelessWidget {
  const ShowPhoto({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile photo'),
      ),
      body: Center(
        child: Hero(
          tag: 'image',
            child: CachedNetworkImage(
              imageUrl: image,
                placeholder: (context, url) => const ShimmerPhoto(),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error,
                    color: Colors.red),
            )),
      ),
    );
  }
}