import 'package:flutter/material.dart';

class ImageNetworkWidget extends StatelessWidget {
  const ImageNetworkWidget({super.key, required this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {

    final url = imageUrl;

    if (url == null || url.isEmpty) {
      return const Icon(Icons.pets, size: 100);
    }

    return Image.network(
      url,
      fit: BoxFit.contain,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(
            child:
            CircularProgressIndicator(strokeWidth: 2));
      },
      errorBuilder: (context, error, stackTrace) =>
      const Center(
          child: Icon(Icons.error, color: Colors.red)),
    );
  }
}
