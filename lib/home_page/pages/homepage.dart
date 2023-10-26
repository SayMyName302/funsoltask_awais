import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,

          leading: Image.asset(
            
              'assets/images/Cognise.png'), // Image on the left side of app bar
          actions: <Widget>[
            Image.asset(
                'assets/images/pro.png'), // Image on the right side of app bar
          ],
        ),
        body: const Center(
          child: Text(
            'Your App Content Goes Here',
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}
