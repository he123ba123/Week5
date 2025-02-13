import 'package:flutter/material.dart';
import 'package:mega_test_api/screen/Test_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            bodyLarge: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple),
            bodyMedium: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const FetchDataScreen());
  }
}
