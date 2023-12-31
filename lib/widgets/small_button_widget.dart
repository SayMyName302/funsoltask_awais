import 'package:flutter/widgets.dart';

class CustomImageAddWidget extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final String imagePath; // Add an imagePath parameter

  CustomImageAddWidget({
    required this.buttonText,
    this.buttonColor = const Color(0xFFD9D9D9),
    this.imagePath = '', // Provide the asset path to the image
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0, left: 16),
        child: IntrinsicWidth(
          child: Container(
            padding: const EdgeInsets.all(7),
            decoration: ShapeDecoration(
              color: const Color(0xFFF5F5F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    imagePath.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.asset(
                              imagePath,
                              width: 16,
                              height: 16,
                            ),
                          )
                        : Container(
                            width: 16, height: 16), // Empty space if no image
                    // Remove Positioned widget here
                    Text(
                      buttonText,
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
