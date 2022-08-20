import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:practice_clean_architecture/router/binding.dart';
import 'package:practice_clean_architecture/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      initialBinding: Binding(),
    );
  }
}
