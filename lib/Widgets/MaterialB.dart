import 'package:flutter/material.dart';

import '../theme.dart';

class CustomMaterialButton extends StatefulWidget {
  int? currentTab;
  String? PrivilegesName;
  IconData iconI;
  CustomMaterialButton(
      {Key? key, this.currentTab, this.PrivilegesName, required this.iconI})
      : super(key: key);

  @override
  State<CustomMaterialButton> createState() => _CustomMaterialButtonState();
}

class _CustomMaterialButtonState extends State<CustomMaterialButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        setState(() {
          // currentScreen = MyWidget();
          widget.currentTab = 0;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.iconI,
            color: widget.currentTab == 2 ? kPrimaryColor : kDarkGreyColor,
          ),
          Text(
            widget.PrivilegesName!,
            style: TextStyle(
              color: widget.currentTab == 2 ? kPrimaryColor : kDarkGreyColor,
            ),
          )
        ],
      ),
    );
  }
}
