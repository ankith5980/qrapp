import 'package:flutter/material.dart';
import 'package:qrapp/loginscreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _nameController = TextEditingController();

  final _rollNoController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  bool loading = false;

  void register() async {
    print(_nameController.text);
    print(_rollNoController.text);
    print(_emailController.text);
    print(_passwordController.text);

    Uri uri = Uri.parse('https://scnner-web.onrender.com/api/register');
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'name': _nameController.text,
          'email': _emailController.text,
          'rollno': _rollNoController.text,
          'password': _passwordController.text,
        }));

    print(response.statusCode);
    print(response.body);

    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LogIn()),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data["message"])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogIn()),
              );
            },
          ),
          backgroundColor: Colors.transparent,
          title: Text(
            "Registration",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(6),
                ),
                hintText: "Enter Your Name",
                hintStyle: TextStyle(color: Colors.white70),
                contentPadding: EdgeInsetsDirectional.all(19.0),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _rollNoController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(6),
                ),
                hintText: "Enter Your Roll No.",
                hintStyle: TextStyle(color: Colors.white70),
                contentPadding: EdgeInsetsDirectional.all(19.0),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(6),
                ),
                hintText: "Enter Your Email",
                hintStyle: TextStyle(color: Colors.white70),
                contentPadding: EdgeInsetsDirectional.all(19.0),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(6),
                ),
                hintText: "Enter Your Password",
                hintStyle: TextStyle(color: Colors.white70),
                contentPadding: EdgeInsetsDirectional.all(19.0),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 2)),
                foregroundColor: Colors.white,
                padding: EdgeInsets.all(19.0),
              ),
              onPressed: () {
                register();
              },
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
