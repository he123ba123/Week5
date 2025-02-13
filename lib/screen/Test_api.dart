import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchDataScreen extends StatefulWidget {
  const FetchDataScreen({super.key});

  @override
  State<FetchDataScreen> createState() => _FetchDataScreenState();
}

class _FetchDataScreenState extends State<FetchDataScreen> {
  Future<Map<String, dynamic>> getTitle() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load title');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'API Test',
          style: TextStyle(fontFamily: "Pacifico"),
        ),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: getTitle(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Title :${snapshot.data!['title']} ",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
