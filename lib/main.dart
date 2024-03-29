import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/view/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterDev Resources',
      theme: ThemeData(
       
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
