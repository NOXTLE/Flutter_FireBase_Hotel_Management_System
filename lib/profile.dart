import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  Future getName() async {
    var UserEmail = FirebaseAuth.instance.currentUser;
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("users")
        .where('email', isEqualTo: UserEmail)
        .get();
    print(UserEmail);
    return snapshot.docs[0]['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Icon(Icons.photo, size: 200),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Name : "),
              FutureBuilder(
                future: getName(),
                builder: (context, snapshot) {
                  String name = snapshot.data.toString();
                  return Text(name);
                },
              )
            ],
          )
        ],
      ),
    ));
  }
}
