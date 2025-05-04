import 'package:flutter/material.dart';
import 'nextpage.dart'; // Ensure this import is present
import 'thirdpage.dart'; // Import your last page
import 'main.dart';
import 'FilterScreen.dart'; // Adjust import based on your file structure

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Start with the first item

  final List<Widget> _screens = [
    HomeScreen1(),
    NextPage(), // Replace with your actual pages
    ThirdPage(),
    AccountScreen(), // Replace with your actual pages
    // Add more pages if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        centerTitle: true,
        title: Text('Beautiq', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => WelcomeScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => FilterScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on), label: 'Location'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Account'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomeScreen()), // Adjust to the correct page if needed
          );
        },
        backgroundColor: Colors.pink,
        child: Icon(Icons.add),
      ),
    );
  }
}

class HomeScreen1 extends StatefulWidget {
  @override
  HomeScreen1State createState() => HomeScreen1State();
}

class HomeScreen1State extends State<HomeScreen1> {
  final List<Map<String, String>> salons = [
    {'name': 'Sheeta', 'distance': '5 km', 'image': 'images/sa1.jpg'},
    {'name': 'Chic', 'distance': '30 km', 'image': 'images/sa2.jpg'},
    {'name': 'Alleanza', 'distance': '40 km', 'image': 'images/sa3.jpg'},
    {'name': 'Nava', 'distance': '10 km', 'image': 'images/sa4.jpg'},
    {'name': 'Ibtissam', 'distance': '45 km', 'image': 'images/sa5.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: salons.map((salon) => salonCard(salon)).toList(),
    );
  }

  Widget salonCard(Map<String, String> salon) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(salon['image']!),
            radius: 30,
          ),
          SizedBox(width: 20),
          Expanded(child: Text('${salon['name']} Salon')),
          Text('${salon['distance']}'),
        ],
      ),
    );
  }
}
