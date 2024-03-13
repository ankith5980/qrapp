import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 57,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Color(0xffCCCCCC), size: 99,)
              ),

              SizedBox(height: 100,),

              QrImageView(
                data: '1234567890',
                version: QrVersions.auto,
                size: 200.0,
                backgroundColor: Colors.white,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

