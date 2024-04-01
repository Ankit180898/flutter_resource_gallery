import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/view/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://thidjugysjrfrbdfkcdc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRoaWRqdWd5c2pyZnJiZGZrY2RjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE2NTMxNDgsImV4cCI6MjAyNzIyOTE0OH0.tYIr65U-W77Y61kLKnYbqaO3ITd6ds0FDxquCiPAeKI',
  );

  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterDev Resources',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
