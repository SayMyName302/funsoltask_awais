// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../widgets/container_widget.dart';
import '../../widgets/custom_card_big.dart';
import '../../widgets/image_card_widget.dart';
import '../../widgets/small_button_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> cardData = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

// This function is responsible for fetching data from a remote API.

  /// Asynchronous function to fetch data from a remote API.
  /// This function makes an HTTP GET request to a specific URL
  /// and processes the response to retrieve a list of maps
  /// containing image URLs and text data.
  /// The function returns a Future that can be null in case of an error.
  Future<List<Map<String, String>>?> fetchData() async {
    try {
      // Send an HTTP GET request to the specified URL.
      final response =
          await http.get(Uri.parse('https://mbl.downloadvid.app/api/data/'));

      if (response.statusCode == 200) {
        // If the response status code is 200 (OK), parse the JSON data.
        final List<dynamic> data = json.decode(response.body)['data'];

        // Transform the dynamic data into a list of maps with specific keys.
        List<Map<String, String>> cardData = data.map((entry) {
          return {
            "image": 'https://mbl.downloadvid.app${entry["icon"]}',
            "text": entry["name"] as String,
          };
        }).toList();

        // Return the list of maps containing image URLs and text data.
        return cardData;
      } else {
        // If the response status code is not 200, throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Catch and handle any exceptions that may occur during the process.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Error: $e'), // Display the error message in a Snackbar.
        ),
      );
      // Return null to indicate an error occurred during data retrieval.
      return null;
    }
  }

  int _selectedIndex = 0; // The index of the selected item.

  // Defining custom icons for the bottom navigation bar.
  List<String> customIcons = [
    'assets/images/Box.svg',
    'assets/images/Image.svg',
    'assets/images/Icon.svg',
    'assets/images/Right-position.svg',
    'assets/images/Setting.svg',
  ];
  //custom texts for bottom nav
  List<String> customText = [
    'Prompt',
    'Image',
    'Saved',
    'Premium',
    'Settings',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0, // Set the app bar background color to white
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/Cognise.png',
                height: 23, width: 92), // Left-side image
            Image.asset('assets/images/frame.png',
                height: 24, width: 48), // Right-side image
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //code for first  container
            //using custom Widget CustomContainerWidget for first two containers
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: CustomContainerWidget(
                title:
                    "A painting of a womdsdsan with long hair, by Mandy Jurgens, charlie bowater at art style, charlie bowater rich deep colors, trending in art station",
                subTitle: "Subtitle text here",
                counter: "150/1000",
                image1Asset: 'assets/images/bulb.png',
                image2Asset: 'assets/images/mic.png',
              ),
            ),
            Row(
              //code for adding and fullscreen button
              children: [
                CustomImageAddWidget(
                  buttonText: 'Add Image',
                  buttonColor: const Color(0xFFD9D9D9),
                  imagePath: 'assets/images/add.png',
                ),
                CustomImageAddWidget(
                  buttonText: '1:1',
                  buttonColor: const Color(0xFFD9D9D9),
                  imagePath: 'assets/images/fullscreen.png',
                ),
              ],
            ),
            Padding(
              //code for second container
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: CustomContainerWidget(
                  title: "A painting of a woman with long hair",
                  subTitle: "Subtitle text here",
                  counter: "150/500",
                  image1Asset: 'assets/images/bulb.png',
                  image2Asset: 'assets/images/mic.png',
                  height: 72),
            ),
            const Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, top: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Styles',
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 16, top: 20, left: 46),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'See all',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFFF95610),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

//Code for displaying the fetched data from API using FutureBuilder

            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: FutureBuilder<List<Map<String, String>>?>(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return const Text('Error: Failed to load data');
                  } else {
                    List<Map<String, String>> cardData = snapshot.data!;
                    return Container(
                      width: 350,
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cardData.length,
                        addAutomaticKeepAlives: true,
                        addRepaintBoundaries: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 80,
                            height: 80,
                            margin: const EdgeInsets.all(8),
                            child: CustomCardView(
                              imageAssetPath: cardData[index]["image"]!,
                              text: cardData[index]["text"]!,
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
            Container(
              width: 343,
              height: 50,
              decoration: ShapeDecoration(
                color: const Color(0xFFF5F5F5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/tune.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Advance Settings',
                                style: TextStyle(
                                  color: Color(0xFF222222),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '(optional)',
                                style: TextStyle(
                                  color: Color(0xFF999999),
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.0, bottom: 2, right: 10),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                width: 343,
                height: 60, // Adjust the height to fit the content
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(1.00, 0.00),
                    end: Alignment(-1, 0),
                    colors: [Color(0xFFE56F4F), Color(0xFFDB2268)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    // Center the content horizontally
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/ads.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Generate',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              )),
                          Text(
                            'Watch an AD',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Inspirations',
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    height: 0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 16, right: 16),
              child: CustomCardView2(
                imageUrls: [
                  'https://mbl.downloadvid.app/media/images/8.png',
                  'https://mbl.downloadvid.app/media/images/4.png',
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(color: Colors.red),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        selectedItemColor: Colors.red,
        items: List.generate(
          customIcons.length,
          (index) {
            return BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  customIcons[index],
                  width: 24,
                  height: 24,
                ),
                label: customText[index]
                // We can set an empty label or provide a title if needed.
                );
          },
        ),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
