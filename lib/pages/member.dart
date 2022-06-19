// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qamar_zaman_kaira/pages/Login.dart';
import 'package:qamar_zaman_kaira/pages/signup.dart';
import 'package:qamar_zaman_kaira/theme.dart';

import '../Widgets/button.dart';

class Member extends StatefulWidget {
  const Member({Key? key}) : super(key: key);

  @override
  State<Member> createState() => _MemberState();
}

class _MemberState extends State<Member> {
  final style = TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
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
          PrimaryButton(
              TextButton: 'become a member',
              ButtonColor: kPrimaryColor,
              TextColor: kWhiteColor,
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ))
                  }),
          PrimaryButton(
              TextButton: 'already have an account',
              ButtonColor: kPrimaryWhiteColor,
              TextColor: kBlackColor,
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ))
                  }),
        ],
      )),
    );
  }
}
