import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        MaterialButton(
            onPressed: () async {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.setString("name", "heba");
            },
            child: const Text("Set Name")),
        MaterialButton(
            onPressed: () async {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              String name = sharedPreferences.getString("name")!;
              print(name);
            },
            child: Text(
              "Submit Name",
              style: Theme.of(context).textTheme.bodyLarge,
            )),
      ],
    ));
  }
}
