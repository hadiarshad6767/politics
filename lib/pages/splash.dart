// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qamar_zaman_kaira/pages/member.dart';

import 'button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
   void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Member(),));
    },);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Container(
     decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFec6753), Color(0xFFda3218)])),
      child: Scaffold(
         backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
            //  CustomButton(onPressed: (){print('hadi');},),
             Expanded(child: _getLogo()),
             SizedBox(
               height: 20,
               width: 20,
               child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white,),
             ),
             SizedBox(
               height: 10,
             ),
            ],
          ),
        ),
      ),
    );
  }
}
 Widget _getLogo(){
   return Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Image.asset('assets/images/k.png',height: 150, width: 150,),
     ],
   );
 }

