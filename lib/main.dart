import 'package:flutter/material.dart';
import 'package:stop_watch/screens/home_screen.dart';

import 'constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stop Watch Flutter',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        appBarTheme: const AppBarTheme(color: appBarColor),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeApp(),
    );
  }
}
