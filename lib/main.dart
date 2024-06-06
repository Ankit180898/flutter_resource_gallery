import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:flutter_resource_gallery/view/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await dotenv.dotenv.load(fileName: '.env');
  final supaUri = dotenv.dotenv.env['SUPABASE_URL']; //get env key
  final supaAnon = dotenv.dotenv.env['SUPABASE_ANONKEY'];
  await Supabase.initialize(
    url: supaUri!,
    anonKey: supaAnon!,
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
      ],
      title: 'FlutterStack',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
