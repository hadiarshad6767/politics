// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qamar_zaman_kaira/pages/Login.dart';
import 'package:qamar_zaman_kaira/pages/signup.dart';

class Member extends StatefulWidget {
  const Member({Key? key}) : super(key: key);

  @override
  State<Member> createState() => _MemberState();
}

class _MemberState extends State<Member> {
  final style = TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 255, 255, 255)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        height: 30,
      ),
      Image.asset(
        'assets/images/login_image.png',
        height: 250,
        width: 250,
      ),
      SizedBox(
        height: 20,
      ),
      Text('Hey!Welcome',
          style: GoogleFonts.poppins(
            textStyle: style,
            fontSize: 35,
            fontWeight: FontWeight.w800,
          )),
      SizedBox(
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Text(
          textAlign: TextAlign.justify,
          'Lorem Ipsum is simply dummy text of the para printing and typesetting.',
          style: GoogleFonts.poppins(
            textStyle: style,
            fontSize: 18,
            color: Color.fromARGB(255, 168, 168, 168),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      SizedBox(
        height: 50,
      ),
      ElevatedButton(
          child: Text(
            'become a member',
            style: GoogleFonts.poppins(
              textStyle: style,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
          onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFe9533c),
            padding: EdgeInsets.symmetric(horizontal: 75, vertical: 15),
          )),
      SizedBox(
        height: 30,
      ),
      ElevatedButton(
          child: Text(
            'already have an account',
            style: GoogleFonts.poppins(
              textStyle: style,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
          },
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 245, 242, 242),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          )),
    ],
  )
        ),
      ),
    );
  }
}

// Widget _getimage() {
//   var style;
//   return 
// }
