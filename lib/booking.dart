import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  @override
  State<Booking> createState() {
    return _BookingState();
  }
}

class _BookingState extends State<Booking> {
  Widget build(context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(245, 238, 200, 100),
        appBar: AppBar(
            backgroundColor: Colors.orange, title: Text("Your Bookings")),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("booking")
              .where('email',
                  isEqualTo: FirebaseAuth.instance.currentUser!.email)
              .snapshots(),
          builder: (context, snapshot) {
            var doc = snapshot.data!.docs;
            return ListView.builder(
              itemCount: doc.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(children: [
                            Icon(Icons.hotel),
                            Text(" Hotel Name : " + doc[index]['hotel_name'])
                          ]),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Icons.people),
                              Text(" Total Number of Guest : " +
                                  doc[index]["guest"]),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.calendar_today),
                                  Text("Check-in: " + doc[index]['check_in']),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.calendar_month),
                              Text("Check-Out: " + doc[index]['check_out']),
                            ],
                          )
                        ],
                      ),
                    )),
              ),
            );
          },
        ));
  }
}
