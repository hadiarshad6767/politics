// ignore_for_file: prefer_const_constructors, annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qamar_zaman_kaira/Widgets/logo.dart';
import 'package:qamar_zaman_kaira/pages/Login.dart';
import 'package:qamar_zaman_kaira/theme.dart';

import '../ApiServices/Privileges.dart';
import '../Widgets/error.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PrivilgeService callprivileges = PrivilgeService();
  @override
  void initState() {
    callprivileges.getPrivilges().then((value) {
      if (value == 200) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ));
      } else {
        CustomDialogBox errorDialog = CustomDialogBox(message: "Token Expire");

        showDialog(
            context: context, builder: (BuildContext context) => errorDialog);
      }
    });

    // print(response);

    // if (response == 200) {
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => Login(),
    //       ));
    // } else {
    //   print("Error: ");
    // }
    // Future.delayed(
    //   Duration(seconds: 5),
    //   () {
    //     Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => Login(),
    //         ));
    //   },
    // );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [sPlash2, sPlash1])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Expanded(child: Logo()),
              Center(
                  child: SizedBox(
                      child:
                          SpinKitChasingDots(color: kWhiteColor, size: 20.0))),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget _getLogo() {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Image.asset(
//         'assets/images/k.png',
//         height: 150,
//         width: 150,
//       ),
//     ],
//   );
// }
