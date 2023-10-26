import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCardView extends StatelessWidget {
  final String imageAssetPath;
  final String text;

  CustomCardView({required this.imageAssetPath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80, // Adjust the width as needed
      height: 80, // Set a fixed height of 80
      child: Stack(
        children: [
          Container(
            width: 80,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                // Use CachedNetworkImage here
                imageUrl: imageAssetPath,
                fit: BoxFit.cover,
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0xFFF95610)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 30,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0.16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
