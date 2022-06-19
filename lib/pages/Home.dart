import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../ApiServices/LoginService.dart';
import '../Widgets/navbar.dart';
import '../theme.dart';

class Home extends StatefulWidget {
  //LoginService service;
  Home({Key? key
      //required this.service
      })
      : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _HomeState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: SideBar(service: this.service),
      appBar: AppBar(
        title: Text("Kaira's Group"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: ((context) => [
                  PopupMenuItem(
                    child: Text('Logout'),
                  )
                ]),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {},
        backgroundColor: kPrimaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
