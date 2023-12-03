import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hms/login/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Icon MyIcon = Icon(Icons.visibility);
  bool isvisible = true;
  void Vi() {
    if (isvisible == false) {
      setState(() {
        MyIcon = const Icon(Icons.visibility_off);
        isvisible = !isvisible;
      });
    } else {
      setState(() {
        MyIcon = const Icon(Icons.visibility);
        isvisible = !isvisible;
      });
    }
  }

  TextEditingController Name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController cnfpassword = TextEditingController();
  void Sign() {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text, password: Password.text);

    submitInfo(email.text, Name.text);
    Name.clear();
    email.clear();
    Password.clear();
    cnfpassword.clear();
  }

  void submitInfo(String email, String name) async {
    await FirebaseFirestore.instance
        .collection('users')
        .add({'name': name, 'email': email}).whenComplete(() => SnackBar(
              content: Container(
                decoration: const BoxDecoration(color: Colors.blue),
                child: const Text("User Has Been Created"),
              ),
            ));
  }

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
            const Text("R E G I S T E R  Y O U R S E L F"),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: Name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "Name"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
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
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: cnfpassword,
                obscureText: isvisible,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "confirm Password",
                    suffix: GestureDetector(child: MyIcon, onTap: Vi)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => Sign(),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: const Text("S I G N  U P"),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already Have an Account ? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login_page()));
                  },
                  child: Text("Login",
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
