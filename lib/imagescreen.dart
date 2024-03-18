import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qrapp/qrscreen.dart';

class ImageScr extends StatefulWidget {
  const ImageScr({super.key});

  @override
  State<ImageScr> createState() => _ImageScrState();
}

class _ImageScrState extends State<ImageScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QrScreen()),
            );
          },
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.teal,
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            width: 300,
            height: 300,
            child: MobileScanner(
              fit: BoxFit.cover,
              onDetect: (barcode, args) {
                print(barcode.rawValue!);
              },
            ),
          ),
        ),
      ),
    );
  }
}
