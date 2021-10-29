import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  CustomNetworkImage(
      {required this.imageUrl,
      this.height = double.infinity,
      this.width = double.infinity});

  final String imageUrl;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      height: height,
      width: width,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            strokeWidth: 1,
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
            height: height,
            width: width,
            child: Center(
                child: Icon(
              Icons.terrain_outlined,
              color: Colors.white,
              size: 24,
            )));
      },
    );
  }
}
