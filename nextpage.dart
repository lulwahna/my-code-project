import 'package:flutter/material.dart';
import 'thirdpage.dart';
import 'main.dart'; // Ensure this import is present

import 'HomeScreen.dart'; // Ensure this import is present

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocationPage(),
      routes: {
        '/mainpage': (context) => WelcomeScreen(),
        '/LocationPage': (context) => LocationPage(),
        '/ServicesPage': (context) => ServicesPage(),
        '/CartPage': (context) => CartPage(),
        '/CheckoutPage': (context) => CheckoutPage(),
      },
    );
  }
}

class LocationPage extends StatelessWidget {
  void _onItemTapped(BuildContext context, int index) {
    if (index == 0) {
    } else if (index == 1) {
      Navigator.pushNamed(context, '/ServicesPage');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/CartPage');
    } else if (index == 3) {
      Navigator.pushNamed(context, '/CheckoutPage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset('images/56.jpg',
              width: double.infinity, height: 250, fit: BoxFit.cover),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10))),
                  SizedBox(height: 20),
                  Text('CHIC salon location',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.pink[100],
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text('CHIC is crowded from 1 pm till 5 pm',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.pink[100],
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Free appointments left for today',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/ServicesPage');
                        },
                        child: Text('ServicesPage'),
                        style: ElevatedButton.styleFrom(),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/CartPage');
                        },
                        child: Text('CartPage'),
                        style: ElevatedButton.styleFrom(),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/CheckoutPage');
                        },
                        child: Text('Checkout'),
                        style: ElevatedButton.styleFrom(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServicesPage extends StatefulWidget {
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('CHIC',
            style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(child: Text('At salon Services')))),
                SizedBox(width: 10),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(child: Text('Home Services')))),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Center(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                padding: EdgeInsets.symmetric(horizontal: 20),
                childAspectRatio: 0.8,
                children: [
                  serviceItem('images/50.jpg', 'Make up', '250 SAR'),
                  serviceItem('images/51.jpg', 'Hair cut', '70 SAR'),
                  serviceItem('images/52.jpg', 'Hair coloring', '200 SAR'),
                  serviceItem('images/53.jpg', 'Gel polish', '400 SAR'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget serviceItem(String imagePath, String title, String price) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(imagePath,
                width: 90, height: 90, fit: BoxFit.cover),
          ),
          SizedBox(height: 10),
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 5),
          Text(price, style: TextStyle(fontSize: 14, color: Colors.black)),
          SizedBox(height: 5),
          Icon(Icons.add_circle, color: Colors.pink, size: 24),
        ],
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('My Cart',
            style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  constraints: BoxConstraints(minWidth: 14, minHeight: 14),
                  child: Center(
                    child: Text('1',
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.pink[50],
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset('images/53.jpg',
                        width: 70, height: 70, fit: BoxFit.cover),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Gel polish',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('The specialist: maila',
                            style: TextStyle(fontSize: 14)),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Icon(Icons.add,
                                      color: Colors.white, size: 16),
                                  SizedBox(width: 5),
                                  Text('1',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Text('total: 400 SAR'),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text('time: 7 pm'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                rowItem('Total Price', '400 SAR'),
                SizedBox(height: 10),
                rowItem('Discount', '0.0'),
                SizedBox(height: 10),
                rowItem('Total Bill', '400 SAR'),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CheckoutPage()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(vertical: 15)),
              child: Center(
                  child: Text('Checkout',
                      style: TextStyle(fontSize: 18, color: Colors.white))),
            ),
          ),
        ],
      ),
    );
  }

  Widget rowItem(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 16)),
        Text(value, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Checkout',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset('images/54.jpg',
                width: double.infinity, height: 150, fit: BoxFit.cover),
          ),
          SizedBox(height: 20),
          Text('or Pay cash',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset('images/55.jpg',
                width: double.infinity, height: 150, fit: BoxFit.cover),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(vertical: 15)),
              child: Center(
                  child: Text('Cancel',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: ''),
        ],
      ),
    );
  }
}
