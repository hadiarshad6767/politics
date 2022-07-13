// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../theme.dart';
import 'hover.dart';

class TextFieldF extends StatefulWidget {
  final IconData iconI;
  final Key? fieldKey;
  final int? maxLength;
  final String? hintText;
  final String? labelText;
  final String ForgetlabelText;
  final String? helperText;
  final TextEditingController? controller;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final bool obscuretext;
  final bool icon;
  final bool Border;
  final bool FoucusBorder;

  // ignore: use_key_in_widget_constructors
  const TextFieldF({
    required this.iconI,
    required this.FoucusBorder,
    required this.Border,
    this.fieldKey,
    this.maxLength,
    this.hintText,
    this.controller,
    this.labelText,
    required this.ForgetlabelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    required this.obscuretext,
    required this.icon,
  });

  @override
  _TextFieldFState createState() =>
      // ignore: no_logic_in_create_state
      _TextFieldFState(obscuretext: obscuretext, icon: icon);
}

class _TextFieldFState extends State<TextFieldF> {
  bool obscuretext;
  bool icon;
  _TextFieldFState({required this.obscuretext, required this.icon});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        key: widget.fieldKey,
        obscureText: obscuretext,
        controller: widget.controller,
        //onSaved: widget.onSaved,
        validator: widget.validator,
        // onFieldSubmitted: widget.onFieldSubmitted,

        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // suffixText: "Hadi",
          // contentPadding: EdgeInsets.all(15),
          hintText: widget.labelText,
          hintStyle: TextStyle(
              color: kTextFieldColor,
              fontSize: 14,
              fontWeight: FontWeight.w500),
          border: widget.Border ? InputBorder.none : null,

          // suffix: InkWellCustom(
          //     TextSimple: widget.ForgetlabelText,
          //     Textsize: 10,
          //     Hoversize: 10,
          //     TextColor: kPrimaryColor,
          //     HoverColor: kPrimaryColor),
          prefixIcon: Icon(widget.iconI, color: kPrimaryColor, size: 24),
          // labelText: widget.labelText,
          // labelStyle: TextStyle(
          //     color: kTextFieldColor,
          //     fontSize: 14,
          //     fontWeight: FontWeight.w500),
          focusedBorder: widget.Border
              ? InputBorder.none
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: kTextFieldColor),
                ),
          // focusedBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(color: kTextFieldColor),
          // ),
          suffixIcon: icon
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscuretext = !obscuretext;
                    });
                  },
                  icon: obscuretext
                      ? Icon(
                          Icons.visibility_off,
                          color: kTextFieldColor,
                        )
                      : Icon(
                          Icons.visibility,
                          color: kPrimaryColor,
                        ),
                )
              : null,
        ));
  }
}
