// ignore: must_be_immutable
import 'package:flutter/material.dart';

import '../theme.dart';

class CustomDialogBox extends StatefulWidget {
  String? message;
  // final String title, descriptions, text;
  // final Image img;

  CustomDialogBox({Key? key, required this.message
      //     required this.title,
      //     required this.descriptions,
      //     required this.text,
      //     required this.img
      })
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 160,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 10, 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.message!,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: kPrimaryColor,
                      child: Text(
                        'Okay',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: -30,
              // left: 110,
              child: IconButton(
                  iconSize: 45,
                  icon: const Icon(Icons.cancel, color: Colors.red, size: 40),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
          ],
        ));
    // return Dialog(
    //     shape:
    //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    //     child: SizedBox(
    //       height: 100.0,
    //       width: 200.0,
    //       // child: Padding(
    //       //   padding: const EdgeInsets.all(.0),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           // Center(
    //           // child:
    //           IconButton(
    //               iconSize: 14,
    //               icon: const Icon(Icons.cancel, color: Colors.red, size: 50),
    //               onPressed: () {
    //                 Navigator.of(context).pop();
    //               }),
    //           //),
    //           Center(
    //               child: Text(
    //             widget.message!,
    //             style: const TextStyle(color: Colors.red),
    //           ))
    //         ],
    //       ),
    //       // ),
    //     ));
  }
}
