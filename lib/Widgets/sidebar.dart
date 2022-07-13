// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names, unnecessary_brace_in_string_interps, duplicate_ignore, must_be_immutable, must_be_immutable, use_key_in_widget_constructors, no_logic_in_create_state, unnecessary_new

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import '../ApiServices/LoginTokenService.dart';
import '../theme.dart';

class SideBar extends StatefulWidget {
  LocalStorage LocalStorageName;
  LocalStorage LocalStorageName1;
  bool user_info;
  SideBar(
      {required this.LocalStorageName,
      required this.LocalStorageName1,
      required this.user_info});
  @override
  State<StatefulWidget> createState() {
    return _SideBar();
  }
}

class _SideBar extends State<SideBar> {
  //LocalStorage LocalStorageName;
  String? value;
  String? value1;
  String? Forename;
  String? Surname;
  String? Username;

  _SideBar();
  List<String?> names = [];
  @override
  initState() {
    super.initState();

    names = widget.LocalStorageName.getItem('privilege_name');
    if (widget.user_info == true) {
      value = widget.LocalStorageName1.getItem('user_info');
      // print('true');
      // value1 = service?.getprivilegesFromLocalStorage();
      // print(value1);
      // var data1 = jsonDecode(value1!);
      // print(data1["pcategory_ID"]);

      final data = jsonDecode(value!);
      Forename = data['forenames'];
      Surname = data['surname'];
      Username = data['user_NAME'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          if (widget.user_info)
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              accountName: Text('${Forename} ${Surname}'),
              accountEmail: Text('${Username}'),
            ),
          for (int i = 0; i < names.length; i++)
            ListTile(
              // leading: Icon(Icons.alt_route_outlined),
              title: Text(names[i].toString()),
              // ignore: avoid_returning_null_for_void
              onTap: () => null,
            ),

          // ListTile(
          //   leading: const Icon(Icons.alt_route_outlined),
          //   title: const Text('Routes'),
          //   onTap: () => print('Rutes'),
          // ),
          // ListTile(
          //   leading: const Icon(Icons.alt_route_outlined),
          //   title: const Text('Routes'),
          //   // ignore: avoid_print
          //   onTap: () => print('Rutes'),
          // ),
          // const Divider(),
          // ListTile(
          //   leading: const Icon(Icons.alt_route_outlined),
          //   title: const Text('Routes'),
          //   onTap: () => print('Rutes'),
          // ),
          // ListTile(
          //   leading: const Icon(Icons.alt_route_outlined),
          //   title: const Text('Routes'),
          //   onTap: () => print('Rutes'),
          // ),
          // ListTile(
          //   leading: const Icon(Icons.alt_route_outlined),
          //   title: const Text('Routes'),
          //   onTap: () => print('Rutes'),
          // ),
          // const Divider(),
          // ListTile(
          //   leading: const Icon(Icons.alt_route_outlined),
          //   title: const Text('Routes'),
          //   onTap: () => print('Routes'),
          // ),
        ],
      ),
    );
  }
}


/*

class SideBar extends StatefulWidget {
  String? Token;
  APIService? service;
  SideBar({required this.Token, required this.service});
  @override
  State<StatefulWidget> createState() {
    return _SideBar(Token: Token, service: service);
  }
}

class _SideBar extends State<SideBar> {
  String? Token;
  APIService? service;
  Future<S>? value;

  APIService Login = new APIService();
  _SideBar({this.Token, this.service});

  @override
  initState() {
    super.initState();
    value = service?.getLoginFromLocalStorage();
    print(value);
    // value = Login.Login3(Token!);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<String>(
        future: value,
        builder: (
          BuildContext context,
          AsyncSnapshot<LocalStorage> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Visibility(
                  visible: snapshot.hasData,
                  child: Text(
                    "${snapshot.data}",
                    style: const TextStyle(color: Colors.black, fontSize: 24),
                  ),
                )
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return ListView(
                padding: EdgeInsets.all(0),
                children: [
                  /*
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                    ),
                    accountName: Text(
                        "${snapshot.data?.forenames} ${snapshot.data?.surnames}"),
                    accountEmail: Text("${snapshot.data?.user_NAME}"),
                  )*/
                  ListTile(
                    leading: const Icon(Icons.alt_route_outlined),
                    title: const Text('Routes'),
                    // ignore: avoid_returning_null_for_void
                    onTap: () => null,
                  ),
                  ListTile(
                    leading: const Icon(Icons.alt_route_outlined),
                    title: const Text('Routes'),
                    onTap: () => print('Rutes'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.alt_route_outlined),
                    title: const Text('Routes'),
                    // ignore: avoid_print
                    onTap: () => print('Rutes'),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.alt_route_outlined),
                    title: const Text('Routes'),
                    onTap: () => print('Rutes'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.alt_route_outlined),
                    title: const Text('Routes'),
                    onTap: () => print('Rutes'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.alt_route_outlined),
                    title: const Text('Routes'),
                    onTap: () => print('Rutes'),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.alt_route_outlined),
                    title: const Text('Routes'),
                    onTap: () => print('Routes'),
                  ),
                ],
              );
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }
}




















class SideBar extends StatelessWidget {
  String? Token;
  APIService? service;
  SideBar({required this.Token, required this.service});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: service?.getLoginFromLocalStorage(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.data == true) {
          return ListView(
            padding: EdgeInsets.all(0),
            children: [
              /*
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                    ),
                    accountName: Text(
                        "${snapshot.data?.forenames} ${snapshot.data?.surnames}"),
                    accountEmail: Text("${snapshot.data?.user_NAME}"),
                  )*/
              ListTile(
                leading: const Icon(Icons.alt_route_outlined),
                title: const Text('Routes'),
                // ignore: avoid_returning_null_for_void
                onTap: () => null,
              ),
              ListTile(
                leading: const Icon(Icons.alt_route_outlined),
                title: const Text('Routes'),
                onTap: () => print('Rutes'),
              ),
              ListTile(
                leading: const Icon(Icons.alt_route_outlined),
                title: const Text('Routes'),
                // ignore: avoid_print
                onTap: () => print('Rutes'),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.alt_route_outlined),
                title: const Text('Routes'),
                onTap: () => print('Rutes'),
              ),
              ListTile(
                leading: const Icon(Icons.alt_route_outlined),
                title: const Text('Routes'),
                onTap: () => print('Rutes'),
              ),
              ListTile(
                leading: const Icon(Icons.alt_route_outlined),
                title: const Text('Routes'),
                onTap: () => print('Rutes'),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.alt_route_outlined),
                title: const Text('Routes'),
                onTap: () => print('Routes'),
              ),
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Visibility(
                visible: snapshot.hasData,
                child: Text(
                  "${snapshot.data}",
                  style: const TextStyle(color: Colors.black, fontSize: 24),
                ),
              )
            ],
          );
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }
}
*/