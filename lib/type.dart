import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login/hotelpage.dart';

// ignore: must_be_immutable
class HotelInfotype extends StatelessWidget {
  String type;
  HotelInfotype({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final userStream = FirebaseFirestore.instance
        .collection('location')
        .where('type', isEqualTo: type)
        .snapshots();
    return Scaffold(
        backgroundColor: Color.fromARGB(245, 238, 200, 100),
        appBar: AppBar(title: Text(type)),
        body: StreamBuilder(
          stream: userStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              log('error');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            var docs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Hotel(hotel: docs[index]['name'])));
                    },
                    child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(192, 161, 161, 0.831),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Image.network(
                              "${docs[index]['image']}",
                              height: 180,
                              width: 150,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  docs[index]['name'],
                                  style: GoogleFonts.notoSans(
                                    textStyle: TextStyle(fontSize: 16),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on),
                                    Text(
                                      docs[index]['city'],
                                      style: GoogleFonts.caprasimo(
                                          textStyle: TextStyle(fontSize: 20)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton.icon(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.orange)),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Hotel(
                                                    hotel: docs[index]['name'],
                                                  )));
                                    },
                                    icon: Icon(Icons.check),
                                    label: Text("Check Info"))
                                // Text(
                                //   "Price : ${docs[index]['price']} / N",
                                //   style: GoogleFonts.caprasimo(
                                //       textStyle: TextStyle(fontSize: 20)),
                                // )
                              ],
                            )
                          ],
                        )),
                  ),
                );
              },
            );
          },
        ));
  }
}
