// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../theme.dart';

class TextFieldF extends StatefulWidget {
  final IconData iconI;
  final Key? fieldKey;
  final int? maxLength;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final TextEditingController? controller;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final bool obscuretext;
  final bool icon;

  // ignore: use_key_in_widget_constructors
  const TextFieldF({
    required this.iconI,
    this.fieldKey,
    this.maxLength,
    this.hintText,
    this.controller,
    this.labelText,
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
            prefixIcon: Icon(
              widget.iconI,
              color: kPrimaryColor,
            ),
            labelText: widget.labelText,
            labelStyle: TextStyle(
              color: kTextFieldColor,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
            ),
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
                : null));

    // decoration: InputDecoration(
    //     labelText: widget.labelText,
    //     labelStyle: const TextStyle(
    //       color: kTextFieldColor,
    //     ),
    //     focusedBorder: const UnderlineInputBorder(
    //       borderSide: BorderSide(color: kPrimaryColor),
    //     ),
    //     suffixIcon: icon
    //         ? IconButton(
    //             onPressed: () {
    //               setState(() {
    //                 obscuretext = !obscuretext;
    //               });
    //             },
    //             icon: obscuretext
    //                 ? const Icon(
    //                     Icons.visibility_off,
    //                     color: kTextFieldColor,
    //                   )
    //                 : const Icon(
    //                     Icons.visibility,
    //                     color: kPrimaryColor,
    //                   ),
    //           )
    //         : null));
  }
}
