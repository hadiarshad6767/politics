// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/forgotpassword.dart';

class InkWellCustom extends StatefulWidget {
  Color? TextColor;
  Color? HoverColor;
  String TextSimple;
  double? Textsize;
  double? Hoversize;
  InkWellCustom(
      {Key? key,
      this.HoverColor,
      this.TextColor,
      required this.TextSimple,
      this.Textsize,
      this.Hoversize})
      : super(key: key);

  @override
  State<InkWellCustom> createState() =>
      // ignore: no_logic_in_create_state
      _InkWellCustomState(size: Textsize, color: TextColor);
}

class _InkWellCustomState extends State<InkWellCustom> {
  double? size;
  Color? color;
  _InkWellCustomState({this.size, this.color});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Forgot()));
        },
        onHover: (value) {
          // print(value);
          setState(() {
            //sideLength = value ? 150 : 50;
            size = value ? widget.Hoversize : widget.Textsize;
            color = value ? widget.HoverColor : widget.TextColor;
          });
        },
        child: Text(
          widget.TextSimple,
          style: GoogleFonts.poppins(
            textStyle: GoogleFonts.poppins(),
            fontSize: size,
            fontWeight: FontWeight.w500,
            // letterSpacing: 1,
            color: color,
          ),
        ));

    //  InkWell(
    //               onHover: (value) {
    //                 if (value) {
    //                   setState(() {
    //                     size = 18;
    //                     kDarkGreyColor = kPrimaryColor;
    //                     // elevation = 100.0;
    //                     // scale = 100.0;
    //                     // translate = Offset(100, 100);
    //                   });
    //                 } else {
    //                   setState(() {
    //                     size = 14;
    //                     kDarkGreyColor = Color(0xFFA8A8A8);
    //                     // elevation = 4.0;
    //                     // scale = 1.0;
    //                     // translate = Offset(0, 0);
    //                   });
    //                 }
    //               },
    //               onTap: () {
    //                 Navigator.push(context,
    //                     MaterialPageRoute(builder: (context) => Forgot()));
    //               },
    //               child: Text(
    //                 'Forgot Password?',
    //                 style: GoogleFonts.poppins(
    //                   textStyle: style,
    //                   fontSize: size,
    //                   fontWeight: FontWeight.w400,
    //                   letterSpacing: 1,
    //                   color: kDarkGreyColor,
    //                 ),
    //               ));
  }
}
