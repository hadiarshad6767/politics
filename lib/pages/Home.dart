import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../ApiServices/LoginTokenService.dart';
import '../LocalStorage/localStorage.dart';
import '../Widgets/navbar.dart';
import '../Widgets/sidebar.dart';
import '../theme.dart';

class Home extends StatefulWidget {
  // LoginTokenService service;
  // localstorageCustom loc = localstorageCustom();
  Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _HomeState();
  localstorageCustom loc = localstorageCustom();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(
          LocalStorageName: loc.SideBarStorage,
          LocalStorageName1: loc.UserInfoStorage,
          user_info: true),
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
      bottomNavigationBar: BottomNavBar(
        LocalStorageName: loc.BottomNavBarStorage,
      ),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
