import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCardView2 extends StatelessWidget {
  final List<String> imageUrls;
  CustomCardView2({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Row(
        children: [
          Expanded(
            child: CardItem(imageUrl: imageUrls[0]),
          ),
          const SizedBox(width: 8), // Add spacing between cards
          Expanded(
            child: CardItem(imageUrl: imageUrls[1]),
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String imageUrl;

  CardItem({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 166,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          height: 220,
          fadeInDuration: const Duration(milliseconds: 300),
          fadeOutDuration: const Duration(milliseconds: 300),
          placeholder: (context, url) => const SizedBox(
              width: 30, height: 30, child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
