import 'package:flutter/material.dart';
import 'EventSaya.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EventSaya(), // PREVIEW HALAMAN KAMU
    );
  }
}
