import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hms/basic_page.dart';
import 'package:hms/login/signUp.dart';
import 'package:firebase_core/firebase_core.dart';

import '../firebase_options.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  var Email = TextEditingController();
  var Password = TextEditingController();
  Icon MyIcon = Icon(Icons.visibility);
  bool isvisible = true;
  void Vi() {
    if (isvisible == false) {
      setState(() {
        MyIcon = Icon(Icons.visibility_off);
        isvisible = !isvisible;
      });
    } else {
      setState(() {
        MyIcon = Icon(Icons.visibility);
        isvisible = !isvisible;
      });
    }
  }

  void login() async {
    var User = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: Email.text, password: Password.text);

    if (User != Null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Layoutpage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.hotel_class_sharp,
              size: 100,
              color: Colors.amber,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "C R O W N",
              style: GoogleFonts.aclonica(
                textStyle: const TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                controller: Email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "Email address"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: Password,
                obscureText: isvisible,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "Password",
                    suffix: GestureDetector(child: MyIcon, onTap: Vi)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: login,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: const Text("L O G  I N"),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't Have An Account ? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text("Create One",
                      style: GoogleFonts.aclonica(
                          textStyle: TextStyle(fontWeight: FontWeight.bold))),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
