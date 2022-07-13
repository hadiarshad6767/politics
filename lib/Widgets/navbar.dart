// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:qamar_zaman_kaira/theme.dart';

import '../ApiServices/LoginTokenService.dart';
import '../LocalStorage/localStorage.dart';
import '../Pivilleges/privilleges.dart';
import '../pages/projects.dart';
import 'MaterialB.dart';

class BottomNavBar extends StatefulWidget {
  LocalStorage LocalStorageName;
  BottomNavBar({Key? key, required this.LocalStorageName}) : super(key: key);

  @override
  State<BottomNavBar> createState() =>
      _BottomNavBarState(LocalStorageName: LocalStorageName);
}

class _BottomNavBarState extends State<BottomNavBar> {
  LocalStorage LocalStorageName;
  @override
  _BottomNavBarState({required this.LocalStorageName});
// localstorageCustom loc = localstorageCustom();
  List<String?> names = [];
  @override
  initState() {
    super.initState();
    // names = loc.LoginBottomNavBarStorage.getItem('privilege_name');
    names = LocalStorageName.getItem('privilege_name');
    // print('initstate');
    // print(names[0]);
    // print(names[1]);
    // print(names[2]);
    // print(names[3]);
  }

  int currentTab = 0;

  List<IconData> _icons = [
    Icons.login,
    Icons.headphones_outlined,
    Icons.ac_unit,
    Icons.help
  ];

  late Widget currentScreen;
  Widget build(BuildContext context) {
    // var name = widget.service!.getLoginBottomFromLocalStorage();
    // print('name: ' + name);
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: kBlackColor,
      notchMargin: 8,
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // for (var i in text) Text(i.toString()),
            for (int i = 0; i < names.length; i++)
              CustomMaterialButton(
                currentTab: 1,
                PrivilegesName: names[i].toString(),
                iconI: _icons[i],
              ),

            // CustomMaterialButton(
            //   currentTab: 1,
            //   PrivilegesName: names[0].toString(),
            //   iconI: Icons.login,
            // ),
            // CustomMaterialButton(
            //     currentTab: 1,
            //     PrivilegesName: names[1].toString(),
            //     iconI: Icons.headphones_outlined),
            // CustomMaterialButton(
            //     currentTab: 1,
            //     PrivilegesName: names[2].toString(),
            //     iconI: Icons.ac_unit),
            // CustomMaterialButton(
            //     currentTab: 1,
            //     PrivilegesName: names[3].toString(),
            //     iconI: Icons.help),

            // CustomMaterialButton(currentTab: 2, PrivilegesName: names[2]),
            // CustomMaterialButton(currentTab: 3, PrivilegesName: names[3]),

            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       MaterialButton(
            //         minWidth: 40,
            //         onPressed: () {
            //           setState(() {
            //             // currentScreen = MyWidget();
            //             currentTab = 0;
            //           });
            //         },
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Icon(
            //               Icons.dashboard,
            //               color:
            //                   currentTab == 0 ? kPrimaryColor : kDarkGreyColor,
            //             ),
            //             Text(
            //               // widget.LB!.PrivilegesName!,
            //               "Projects",
            //               style: TextStyle(
            //                 color: currentTab == 0
            //                     ? kPrimaryColor
            //                     : kDarkGreyColor,
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //       MaterialButton(
            //         minWidth: 40,
            //         onPressed: () {
            //           setState(() {
            //             //  currentScreen = Chat();
            //             currentTab = 1;
            //           });
            //         },
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Icon(
            //               Icons.chat,
            //               color:
            //                   currentTab == 1 ? kPrimaryColor : kDarkGreyColor,
            //             ),
            //             Text(
            //               'Projects',
            //               style: TextStyle(
            //                 color: currentTab == 1
            //                     ? kPrimaryColor
            //                     : kDarkGreyColor,
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     MaterialButton(
            //       minWidth: 40,
            //       onPressed: () {},
            //       //  {
            //       //   setState(() {
            //       //     currentScreen = MyMap();
            //       //     currentTab = 2;
            //       //   });
            //       // },
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Icon(
            //             Icons.map,
            //             color: currentTab == 2 ? kPrimaryColor : kDarkGreyColor,
            //           ),
            //           Text(
            //             'Polling Stations',
            //             style: TextStyle(
            //               color:
            //                   currentTab == 2 ? kPrimaryColor : kDarkGreyColor,
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //     MaterialButton(
            //       minWidth: 40,
            //       onPressed: () {},
            //       //  {
            //       //   setState(() {
            //       //     currentScreen = Profile();
            //       //     currentTab = 3;
            //       //   });
            //       // },
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Icon(
            //             Icons.account_box,
            //             color: currentTab == 3 ? kPrimaryColor : kDarkGreyColor,
            //           ),
            //           Text(
            //             'Profile',
            //             style: TextStyle(
            //               color:
            //                   currentTab == 3 ? kPrimaryColor : kDarkGreyColor,
            //             ),
            //           )
            //         ],
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
