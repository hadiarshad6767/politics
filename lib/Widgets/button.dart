// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final Color ButtonColor;
  final Color TextColor;
  final GestureTapCallback onPressed;
  final String TextButton;
  const PrimaryButton(
      {Key? key,
      required this.ButtonColor,
      required this.TextColor,
      required this.onPressed,
      required this.TextButton})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1.4 * (MediaQuery.of(context).size.height / 25),
        width: (MediaQuery.of(context).size.width / 2.23),
        margin: const EdgeInsets.only(bottom: 10),
        // ignore: deprecated_member_use
        child: FlatButton(
            color: ButtonColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            onPressed: onPressed,
            child: Text(
              TextButton,
              style: GoogleFonts.poppins(
                textStyle: GoogleFonts.poppins(),
                fontSize: 15,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                color: TextColor,
              ),
            )));
  }
}
