// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qamar_zaman_kaira/theme.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  int currentTab = 0;
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed:
                      () {} /*{
                      setState(() {
                        currentScreen = Dashboard();
                        currentTab = 0;
                      });
                    }*/
                  ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.dashboard,
                        color: currentTab == 0 ? kPrimaryColor : kDarkGreyColor,
                      ),
                      Text(
                        'Members',
                        style: TextStyle(
                          color:
                              currentTab == 0 ? kPrimaryColor : kDarkGreyColor,
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {}, // {
                  //   setState(() {
                  //     currentScreen = Chat();
                  //     currentTab = 1;
                  //   });
                  // }
                  // ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.chat,
                        color: currentTab == 1 ? kPrimaryColor : kDarkGreyColor,
                      ),
                      Text(
                        'Projects',
                        style: TextStyle(
                          color:
                              currentTab == 1 ? kPrimaryColor : kDarkGreyColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {},
                  //  {
                  //   setState(() {
                  //     currentScreen = MyMap();
                  //     currentTab = 2;
                  //   });
                  // },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.map,
                        color: currentTab == 2 ? kPrimaryColor : kDarkGreyColor,
                      ),
                      Text(
                        'Polling Stations',
                        style: TextStyle(
                          color:
                              currentTab == 2 ? kPrimaryColor : kDarkGreyColor,
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {},
                  //  {
                  //   setState(() {
                  //     currentScreen = Profile();
                  //     currentTab = 3;
                  //   });
                  // },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_box,
                        color: currentTab == 3 ? kPrimaryColor : kDarkGreyColor,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color:
                              currentTab == 3 ? kPrimaryColor : kDarkGreyColor,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
