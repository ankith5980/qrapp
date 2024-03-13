import 'package:flutter/material.dart';
import 'package:qrapp/qrscreen.dart';
import 'package:qrapp/registration.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  hintText: "Enter Your Roll No",
                  hintStyle: TextStyle(color: Colors.white70),
                  contentPadding: EdgeInsetsDirectional.all(19.0)),
            ),
            SizedBox(height: 25),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(6),
                ),
                hintText: "Enter Your Password",
                hintStyle: TextStyle(color: Colors.white70),
                contentPadding: EdgeInsetsDirectional.all(19.0),
              ),
            ),
            SizedBox(height: 30),
            TextButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1)),
                foregroundColor: Colors.white,
                padding: EdgeInsets.all(19.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QrScreen()),
                );
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                child: Text(
                  "Don't have an account? Register",
                  style: TextStyle(color: Colors.white70),
                ))
          ],
        )),
      ),
    );
  }
}
