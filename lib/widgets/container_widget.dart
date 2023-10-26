import 'package:flutter/material.dart';

class CustomContainerWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String counter;
  final String image1Asset; // Asset path for the first image.
  final String image2Asset; // Asset path for the second image.
  final double height;

  CustomContainerWidget({
    required this.title,
    required this.subTitle,
    required this.counter,
    required this.image1Asset, // Provide asset paths for the images.
    required this.image2Asset,
    this.height = 108.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: height,
      decoration: ShapeDecoration(
        color: Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            right: 44,
            child: Text(title),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Icon(Icons.close),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Text(
              counter,
              style: TextStyle(
                color: Color(0xFF999999),
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Row(
              children: [
                Image.asset(image1Asset), // Load the first image from assets.
                SizedBox(width: 10),
                Image.asset(image2Asset), // Load the second image from assets.
              ],
            ),
          ),
        ],
      ),
    );
  }
}
