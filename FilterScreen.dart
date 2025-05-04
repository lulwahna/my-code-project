import 'package:flutter/material.dart';
import 'main.dart'; // Adjust import based on your file structure
import 'HomeScreen.dart'; // Ensure this import is present

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        title: Text('Filter', style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Status',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            CheckboxListTile(
                title: Text('Home visit Salons'),
                value: true,
                onChanged: (val) {}),
            CheckboxListTile(
                title: Text('At salon only'),
                value: false,
                onChanged: (val) {}),
            CheckboxListTile(
                title: Text('Open'), value: false, onChanged: (val) {}),
            CheckboxListTile(
                title: Text('Closed'), value: false, onChanged: (val) {}),
          ],
        ),
      ),
    );
  }
}
