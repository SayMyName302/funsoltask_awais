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
          SizedBox(width: 8), // Add spacing between cards
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
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: 220,
        ),
      ),
    );
  }
}
