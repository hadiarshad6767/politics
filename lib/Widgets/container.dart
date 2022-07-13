// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:qamar_zaman_kaira/Widgets/button.dart';
// import 'package:qamar_zaman_kaira/Widgets/hover.dart';

// import '../ApiServices/LoginService.dart';
// import '../model/model.dart';
// import '../pages/Home.dart';
// import '../theme.dart';
// import 'Login_form.dart';

// class LoginContainer extends StatefulWidget {
//   final TextEditingController? controllerUsername;
//   final TextEditingController? controllerPassword;
//   final Function(bool) onChange;
//   bool loading;
//   LoginContainer(
//       {Key? key,
//       required this.loading,
//       this.controllerUsername,
//       this.controllerPassword,
//       required this.onChange})
//       : super(key: key);

//   @override
//   State<LoginContainer> createState() => _LoginContainerState();
// }

// class _LoginContainerState extends State<LoginContainer> {
//   LoginRequestModel loginrequest = LoginRequestModel();
//   final style = TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Material(
//         child: Container(
//           alignment: Alignment.centerLeft,
//           height: MediaQuery.of(context).size.height * 0.45,
//           width: MediaQuery.of(context).size.width * 0.8,
//           decoration: BoxDecoration(
//               color: kWhiteColor,
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(20),
//               )),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               // Text(
//               //   'Login Here',
//               //   style: GoogleFonts.poppins(
//               //     textStyle: style,
//               //     fontSize: 25,
//               //     fontWeight: FontWeight.w600,
//               //     letterSpacing: 1,
//               //     color: kBlackColor,
//               //   ),
//               // ),
//               LogInForm(
//                   controllerUsername: widget.controllerUsername,
//                   controllerPassword: widget.controllerPassword),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: InkWellCustom(
//                       TextSimple: 'Forgot Password?',
//                       Textsize: 14,
//                       Hoversize: 14,
//                       TextColor: kDarkGreyColor,
//                       HoverColor: kPrimaryColor),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),

//               PrimaryButton(
//                   TextButton: "Login",
//                   ButtonColor: kPrimaryColor,
//                   TextColor: kWhiteColor,
//                   onPressed: () {
//                     setState(() {
//                       widget.loading = true;
//                     });
//                     widget.onChange(true);
//                     LoginService login = LoginService();
//                     loginrequest.username = widget.controllerUsername!.text;
//                     loginrequest.password = widget.controllerPassword!.text;
//                     login.login(loginrequest).then((value) {
//                       if (value.token != null) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Home(service: login)),
//                         );
//                         setState(() {
//                           widget.loading = false;
//                         });
//                       } else {
//                         print(value.message);
//                         setState(() => widget.loading = false);
//                         final snakbar =
//                             SnackBar(content: Text(value.message.toString()));
//                         ScaffoldMessenger.of(context).showSnackBar(snakbar);
//                       }
//                     });
//                   }),

//               // LoginButton(
//               //     ButtonColor: kPrimaryColor,
//               //     T: kWhiteColor,
//               //     TextButton: 'Login',
//               //     onPressed: () {

//               //       loginrequest.username = myControllerUsername.text;
//               //       loginrequest.password = myControllerPassword.text;
//               //       setState(() => loading = true);
//               //       loginservice.Login(loginrequest).then((value) {
//               //         if (value.token != null) {
//               //           Navigator.push(
//               //             context,
//               //             MaterialPageRoute(builder: (context) => HomePage()),
//               //           );
//               //         } else {
//               //           print(value.message);
//               //         }

//               //       }

//               // );
//               //     }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
