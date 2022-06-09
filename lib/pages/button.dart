// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final TextButton;
  const LoginButton({required this.onPressed, this.TextButton});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1.4 * (MediaQuery.of(context).size.height / 20),
        width: 5 * (MediaQuery.of(context).size.width / 10),
        margin: const EdgeInsets.only(bottom: 20),
        // ignore: deprecated_member_use
        child: RaisedButton(
            elevation: 5,
            color: const Color(0xFFe9533c),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: onPressed,
            child: Text(
              TextButton,
              style: GoogleFonts.poppins(
                textStyle: GoogleFonts.poppins(),
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            )));
  }
}
