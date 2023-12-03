import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hms/booking.dart';
import 'package:intl/intl.dart';

class Hotel extends StatefulWidget {
  final hotel;
  const Hotel({super.key, required this.hotel});

  @override
  State<Hotel> createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  @override
  Widget build(BuildContext context) {
    final firebase = FirebaseFirestore.instance
        .collection("location")
        .where('name', isEqualTo: widget.hotel)
        .snapshots();
    DateTime? selectedDate = DateTime.now();

    var checkout = TextEditingController();
    var checkin = TextEditingController();
    var guest = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text(widget.hotel)),
      body: StreamBuilder(
        stream: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("error encountered");
          }
          var docs = snapshot.data!.docs;
          var name = docs[0]['name'];
          return ListView(
            children: [
              Image.network("${docs[0]['image']}"),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${docs[0]['star']} Star Hotel',
                    style: TextStyle(color: Colors.orange)),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${docs[0]['name']}",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 32),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [Icon(Icons.location_on), Text(docs[0]['city'])],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Step into the Realm of Opulence at the Majestic Grand Hotel"),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "Welcome to the ${docs[0]['name']}, where luxury knows no bounds. Prepare to be enveloped in an atmosphere of unparalleled elegance and sophistication, where every detail is meticulously crafted to exceed your expectations. Our ${docs[0]['star']}-star haven is an oasis of tranquility amidst the vibrant cityscape, offering discerning travelers a sanctuary of unparalleled comfort and personalized service."),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 50,
                color: Colors.orange,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("P R I C E : ${docs[0]['price']}/N",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 18, color: Colors.white))),
                      ),
                      GestureDetector(
                          child: Text("B O O K  N O W",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Container(
                                      height: 310,
                                      child: Column(
                                        children: [
                                          TextField(
                                            controller: guest,
                                            decoration: const InputDecoration(
                                                hintText: "Number of Guests",
                                                border: OutlineInputBorder()),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextField(
                                            controller: checkin,
                                            onTap: () async {
                                              DateTime? valueci =
                                                  await showDatePicker(
                                                      context: context,
                                                      firstDate: DateTime(1000),
                                                      lastDate: DateTime(2500),
                                                      initialDate:
                                                          selectedDate);
                                              if (valueci != null) {
                                                setState(() {
                                                  String formatDate =
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(valueci);
                                                  checkin.text = formatDate;
                                                });
                                              }
                                            },
                                            readOnly: true,
                                            decoration: const InputDecoration(
                                              hintText: "Check In Date",
                                              border: OutlineInputBorder(),
                                              prefixIcon:
                                                  Icon(Icons.calendar_today),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          TextField(
                                            controller: checkout,
                                            onTap: () async {
                                              DateTime? value =
                                                  await showDatePicker(
                                                      context: context,
                                                      firstDate: DateTime(1000),
                                                      lastDate: DateTime(2500),
                                                      initialDate:
                                                          selectedDate);
                                              if (value != null) {
                                                setState(() {
                                                  String formatDate =
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(value);
                                                  checkout.text = formatDate;
                                                });
                                              }
                                            },
                                            readOnly: true,
                                            decoration: const InputDecoration(
                                              hintText: "Check Out Date",
                                              border: OutlineInputBorder(),
                                              prefixIcon:
                                                  Icon(Icons.calendar_today),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          ElevatedButton(
                                            onPressed: () async {
                                              User? user = await FirebaseAuth
                                                  .instance.currentUser;

                                              print(user!.email.toString());
                                              FirebaseFirestore.instance
                                                  .collection("booking")
                                                  .add({
                                                "guest": guest.text,
                                                "check_in": checkin.text,
                                                "check_out": checkout.text,
                                                "hotel_name": docs[0]['name'],
                                                "email": user.email.toString(),
                                              }).then(
                                                (value) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Booking(),
                                                      ));
                                                },
                                              );
                                            },
                                            child: const Text("Book Now"),
                                          )
                                        ],
                                      )),
                                );
                              },
                            );
                          })
                    ]),
              )
            ],
          );
        },
      ),
    );
  }
}
