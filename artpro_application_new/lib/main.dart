import 'package:flutter/material.dart';
import './splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: "Aplikasi ARTPro",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    home: const SplashScreen(),
  ));
}
