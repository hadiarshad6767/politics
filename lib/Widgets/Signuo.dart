// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';

import '../theme.dart';
import 'hover.dart';

class ShiftCustom extends StatefulWidget {
  String SimpleText;
  Color? TextColor;
  String InkText;
  Color? InkTextColor;
  Color? InkTextHoverColor;
  double? InkTextSize;
  double? InkTextHoverSize;

  ShiftCustom(
      {Key? key,
      required this.SimpleText,
      this.TextColor,
      required this.InkText,
      this.InkTextColor,
      this.InkTextHoverColor,
      this.InkTextSize,
      this.InkTextHoverSize})
      : super(key: key);

  @override
  State<ShiftCustom> createState() => _ShiftCustomState();
}

class _ShiftCustomState extends State<ShiftCustom> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: kPrimaryWhiteColor,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(widget.SimpleText,
              style: TextStyle(
                color: widget.TextColor,
                fontSize: MediaQuery.of(context).size.height / 40,
                fontWeight: FontWeight.w400,
              )),
          InkWellCustom(
            TextSimple: widget.InkText,
            TextColor: widget.InkTextColor,
            HoverColor: widget.InkTextHoverColor,
            Textsize: widget.InkTextSize,
            Hoversize: widget.InkTextHoverSize,
          )
        ]),
      ),
    );
  }
}
