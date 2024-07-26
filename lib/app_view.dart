import 'package:flutter/material.dart';
import 'package:myapp/screen/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
        surface: Colors.white,
        onSurface: Colors.black,
        primary: Colors.black45,
        onPrimary: Colors.white,
      )),
      home: const HomeScreen(
        title: 'flutter demo',
      ),
    );
  }
}
