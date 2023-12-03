import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hms/type.dart';

import 'hotelinfo.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  var search = TextEditingController();
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(245, 238, 200, 100),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                controller: search,
                onSubmitted: (String value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HotelInfo(city: search.text)));
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange)),
                  hintText: "Search your city",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            CarouselSlider(
                items: [
                  "https://img.freepik.com/free-photo/design-house-modern-villa-with-open-plan-living-private-bedroom-wing-large-terrace-with-privacy_1258-169741.jpg",
                  "https://cdn.pixabay.com/photo/2015/03/09/18/34/beach-666122_1280.jpg"
                ].map((i) {
                  return Builder(builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Image.network(i),
                      ),
                    );
                  });
                }).toList(),
                options: CarouselOptions(
                    autoPlay: true,
                    height: MediaQuery.sizeOf(context).height > 720
                        ? MediaQuery.of(context).size.height / 3
                        : MediaQuery.of(context).size.height / 4)),
            const SizedBox(
              height: 20,
            ),
            Text(
              "C H O O S E   A   S T A T E",
              style: GoogleFonts.newsreader(
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(234, 229, 236, 0.893),
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width,
                height: 520,
                child: Column(children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HotelInfo(city: "goa")));
                                },
                                child: const CircleAvatar(
                                  maxRadius: 50,
                                  backgroundImage: NetworkImage(
                                      "https://t4.ftcdn.net/jpg/00/55/80/93/360_F_55809309_pv0ikbHzDrrZUBoRTDYYN6Gv4IvUuWEZ.jpg"),
                                ),
                              ),
                            ),
                            Text("G O A")
                          ]),
                        ),
                      ),

                      // Hydrabad
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Column(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HotelInfo(city: "Telangana")));
                                },
                                child: const CircleAvatar(
                                  maxRadius: 50,
                                  backgroundImage: NetworkImage(
                                      "https://thumbs.dreamstime.com/b/famous-hyderabad-landmark-charminar-india-world-built-quli-qutb-shah-th-century-128124667.jpg"),
                                ),
                              ),
                            ),
                            Text("T E L A N G N A")
                          ]),
                        ),
                      ),
                      //Delhi
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Column(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HotelInfo(city: "delhi")));
                                },
                                child: const CircleAvatar(
                                  maxRadius: 50,
                                  backgroundImage: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlJPXTVZFXf3ltbT351ycPckwyRZV6w0ZVPFixsuqrNw&s"),
                                ),
                              ),
                            ),
                            Text("D E L H I ")
                          ]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //BOX 2

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HotelInfo(city: "kerela")));
                                },
                                child: CircleAvatar(
                                  maxRadius: 50,
                                  backgroundImage: NetworkImage(
                                      "https://www.keralahouseboat.in/images/slide3.jpg"),
                                ),
                              ),
                            ),
                            Text("K E R E L A")
                          ]),
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HotelInfo(city: "rajasthan")));
                                },
                                child: CircleAvatar(
                                  maxRadius: 50,
                                  backgroundImage: NetworkImage(
                                      "https://www.timesindiatravels.com/wp-content/uploads/2017/09/Rajasthan-Desert-Tour.jpg"),
                                ),
                              ),
                            ),
                            Text("R A J A S T H A N")
                          ]),
                        ),
                      ),
                      //Delhi
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HotelInfo(city: "Assam")));
                                },
                                child: CircleAvatar(
                                  maxRadius: 50,
                                  backgroundImage: NetworkImage(
                                      "https://img.freepik.com/premium-photo/village-hills-state-assam_865967-3357.jpg"),
                                ),
                              ),
                            ),
                            Text("A S S A M ")
                          ]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //box 3
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 0.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HotelInfo(city: "chandigarh")));
                                },
                                child: CircleAvatar(
                                  maxRadius: 50,
                                  backgroundImage: NetworkImage(
                                      "https://upload.wikimedia.org/wikipedia/commons/3/3a/The_Open_Hand_Monument%2C_Capitol_Complex%2C_Chandigarh.jpg"),
                                ),
                              ),
                            ),
                            Text("C H A N D I G A R H")
                          ]),
                        ),
                      ),

                      // Hydrabad
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Container(
                          child: const Column(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: CircleAvatar(
                                maxRadius: 50,
                                backgroundImage: NetworkImage(
                                    "https://www.adarshdevelopers.com/blog/wp-content/uploads/2019/08/with-tunnelling-to-begin-soon-bangalore-metro-rail-corporation.jpg"),
                              ),
                            ),
                            Text("B A N G A L O R E")
                          ]),
                        ),
                      ),
                      //Delhi
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: const Column(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: CircleAvatar(
                                maxRadius: 50,
                                backgroundImage: NetworkImage(
                                    "https://img.freepik.com/premium-photo/village-hills-state-assam_865967-3357.jpg"),
                              ),
                            ),
                            Text("A S S A M ")
                          ]),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            const SizedBox(height: 20),
            Text("C H O O S E   A C C O M O D A T I O N",
                style: GoogleFonts.dmSans()),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  var value = index;
                  var text = [
                    "villa",
                    "penthouse",
                    "resort",
                    "boathouse",
                    "palace",
                    "suite"
                  ];
                  List abc = [
                    'https://img.freepik.com/free-photo/luxury-pool-villa-spectacular-contemporary-design-digital-art-real-estate-home-house-property-ge_1258-150765.jpg',
                    'https://static.toiimg.com/thumb/msid-84260229,width-748,height-499,resizemode=4,imgsize-215954/.jpg',
                    'https://images.pexels.com/photos/261169/pexels-photo-261169.jpeg?cs=srgb&dl=pexels-pixabay-261169.jpg&fm=jpg',
                    'https://media.istockphoto.com/id/1266651692/photo/houseboat-in-alappuzha-backwaters-kerala.jpg?s=612x612&w=0&k=20&c=G432lmdUz9qrW6D4sZYxLe6K-Km85OEmZg0qpcGyRCI=',
                    'https://media.istockphoto.com/id/1066999762/photo/3d-rendering-beautiful-luxury-bedroom-suite-in-hotel-with-tv.jpg?b=1&s=612x612&w=0&k=20&c=VTg64z9xvk35ao25s0UOjWxCJg3nrA5e3BGP4nID-YA='
                  ];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HotelInfotype(
                                      type: text[index],
                                    )));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          height: 250,
                          width: 250,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SizedBox(
                                  height: 180,
                                  width: 200,
                                  child: Image.network(
                                    abc[value],
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                  ),
                                ),
                              ),
                              Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text("${text[value]}",
                                          style:
                                              GoogleFonts.dmSans(fontSize: 12)),
                                    ),
                                  ))
                            ]),
                          )),
                    ),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
