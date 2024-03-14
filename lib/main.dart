import 'package:flutter/material.dart';
import 'package:qrapp/loginscreen.dart';
import 'package:qrapp/profilescreen.dart';

void main() {
  runApp(const QrApp());
}

class QrApp extends StatefulWidget {
  const QrApp({super.key});

  @override
  State<QrApp> createState() => _QrAppState();
}

class _QrAppState extends State<QrApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Profile(),
    );
  }
}
