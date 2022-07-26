// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  final Color colorB;
  final Color colorT;
  final GestureTapCallback onPressed;
  final String TextButton;
  const LoginButton(
      {Key? key,
      required this.colorB,
      required this.colorT,
      required this.onPressed,
      required this.TextButton})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1.4 * (MediaQuery.of(context).size.height / 20),
        width: 5 * (MediaQuery.of(context).size.width / 10),
        margin: const EdgeInsets.only(bottom: 20),
        // ignore: deprecated_member_use
        child: RaisedButton(
            elevation: 5,
            color: colorB,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: onPressed,
            child: Text(
              TextButton,
              style: GoogleFonts.poppins(
                textStyle: GoogleFonts.poppins(),
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                color: colorT,
              ),
            )));
  }
}
