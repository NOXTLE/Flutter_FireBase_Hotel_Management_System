import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hms/login/login.dart';
import 'package:hms/profile.dart';

import 'home.dart';
import 'booking.dart';

class Layoutpage extends StatefulWidget {
  const Layoutpage({super.key});

  State<Layoutpage> createState() {
    return _LayoutpageState();
  }
}

class _LayoutpageState extends State<Layoutpage> {
  int index = 0;
  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login_page()));
  }

  Future<String> getUserName() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userEmail = user.email ?? "";
      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: userEmail)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          // Assuming there's only one user with the given email
          return querySnapshot.docs[0]['name'];
        }
      } catch (e) {
        print('Error getting user name: $e');
      }
    }
    return ""; // Return an empty string if no user or name found
  }

  var currentEmail = FirebaseAuth.instance.currentUser!.email;
  var data = FirebaseFirestore.instance.collection('users').get();
  late String name;

  @override
  Widget build(context) {
    return Scaffold(
      drawer: Drawer(
          shadowColor: Colors.black,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              CircleAvatar(
                  backgroundImage: const NetworkImage(
                      "https://www.istockphoto.com/resources/images/PhotoFTLP/P3-SEPT-iStock-1178554344.jpg"),
                  minRadius: MediaQuery.of(context).size.width / 4),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: getUserName(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Future is still loading
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      // Error in fetching data
                      return Text('Error: ${snapshot.error}');
                    } else {
                      // Data loaded successfully
                      String userName = snapshot.data ?? "Unknown";
                      return Text('Welcome, $userName!');
                    }
                  }),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(245, 238, 200, 100))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profile(),
                        ));
                  },
                  child: const Text("Edit Profile")),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Center(child: Text("M Y  B O O K I N G S")),
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Center(child: Text("C O N T A C T  U S")),
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Center(child: Text("R A T E  U S")),
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: logout,
                child: Text("LOGOUT"),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text("F O L L O W  U S"),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            "https://upload.wikimedia.org/wikipedia/en/thumb/0/04/Facebook_f_logo_%282021%29.svg/2048px-Facebook_f_logo_%282021%29.svg.png",
                            height: 50,
                          ),
                        ]),
                  )
                ],
              )
            ],
          )),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.account_circle_sharp),
          )
        ],
        title: Image.network(
          'https://assets.stickpng.com/images/60361355d5d099000442a808.png',
          width: 100,
          height: 50,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: IndexedStack(
        index: index,
        children: [Home(), Booking()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          selectedIconTheme: const IconThemeData(color: Colors.orange),
          unselectedItemColor: Colors.black,
          currentIndex: index,
          selectedFontSize: 18,
          elevation: 1,
          selectedItemColor: Colors.orange,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_travel_rounded), label: "Booking"),
          ]),
    );
  }
}

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<String> getUserName(String userEmail) async {
  String userName = "";
  try {
    QuerySnapshot querySnapshot = await firestore
        .collection('users')
        .where('email', isEqualTo: userEmail)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Assuming there's only one user with the given email
      userName = querySnapshot.docs[0]['name'];
    }
  } catch (e) {
    print('Error getting user name: $e');
  }

  return userName;
}
