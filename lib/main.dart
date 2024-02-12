import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictap/presentation/tictap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Background color of the splash screen
      body: Center(
        child: FutureBuilder(
          // Simulate a loading process using a Future
          future: Future.delayed(Duration(seconds: 3)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While waiting, you can show a loading indicator or any other widget
              return CircularProgressIndicator(
                color: Colors.white,
              );
            } else {
              // After the delay, navigate to the main screen or another screen
              return Tictap();
            }
          },
        ),
      ),
    );
  }
}
