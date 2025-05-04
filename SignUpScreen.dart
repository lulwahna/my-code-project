import 'package:flutter/material.dart';
import 'main.dart'; // Adjust import based on your file structure
import 'HomeScreen.dart'; // Adjust import based on your file structure

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to WelcomeScreen
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => WelcomeScreen()),
              (Route<dynamic> route) => false, // Remove all previous routes
            );
          },
        ),
        backgroundColor: Colors.pink,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              buildTextField('Full Name'),
              SizedBox(height: 20),
              buildTextField('Email'),
              SizedBox(height: 20),
              buildTextField('Password', isPassword: true),
              SizedBox(height: 20),
              buildTextField('City'),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                ),
                onPressed: () {
                  // Navigate to HomeScreen when the button is pressed
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text('Sign Up', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.pink[50],
            suffixIcon: isPassword ? Icon(Icons.visibility_off) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        )
      ],
    );
  }
}
