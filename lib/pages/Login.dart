// ignore_for_file: deprecated_member_use, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qamar_zaman_kaira/pages/signup.dart';

import 'package:qamar_zaman_kaira/theme.dart';
import '../ApiServices/LoginService.dart';
import '../Widgets/Login_form.dart';
//import '../Widgets/Signuo.dart';
import '../Widgets/button.dart';

// import '../Widgets/container.dart';
// import '../Widgets/hover.dart';
// import '../Widgets/logo.dart';
import '../Widgets/navbar.dart';
import '../Widgets/sidebar.dart';
import '../model/model.dart';
import 'Home.dart';
import 'button.dart';
import 'forgotpassword.dart';
import 'loading.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginService login = LoginService();
  // LoginService loginservice = LoginService();
  bool passwordObsecured = true;
  get style => null;
  late String email, password;
  bool _isObscure = true;
  final myControllerUsername = TextEditingController();
  final myControllerPassword = TextEditingController();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool loading = false;

  Widget _buildlogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //  LoginButton(onPressed: (){print('hadi');},),
        //
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
          ),
          child: Image.asset(
            'assets/images/k.png',
            height: 100,
            width: 100,
          ),
        ),
      ],
    );
  }

  Widget _BuildContainer() {
    LoginRequestModel? loginrequest = LoginRequestModel();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        alignment: Alignment.centerLeft,
        // height: MediaQuery.of(context).size.height * 0.45,
        // width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   'Login Here',
            //   style: GoogleFonts.poppins(
            //     textStyle: style,
            //     fontSize: 25,
            //     fontWeight: FontWeight.w600,
            //     letterSpacing: 1,
            //     color: kBlackColor,
            //   ),
            // ),
            LogInForm(
                controllerUsername: myControllerUsername,
                controllerPassword: myControllerPassword),

            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Padding(
            //     padding: const EdgeInsets.all(10),
            //     child: InkWellCustom(
            //         TextSimple: 'Forgot Password?',
            //         Textsize: 14,
            //         Hoversize: 14,
            //         TextColor: kDarkGreyColor,
            //         HoverColor: kPrimaryColor),
            //   ),
            // ),
            const SizedBox(
              height: 5,
            ),

            Container(
              // clipBehavior: Clip.hardEdge,
              //height: 100,
              width: 397,
              child: Row(
                children: [
                  PrimaryButton(
                      TextButton: "Signup",
                      ButtonColor: kZambeziColor,
                      TextColor: kWhiteColor,
                      onPressed: () {
                        setState(() {
                          loading = true;
                        });
                        // widget.onChange(true);
                        LoginService login = LoginService();
                        loginrequest.username = myControllerUsername.text;
                        loginrequest.password = myControllerPassword.text;
                        login.login(loginrequest).then((value) {
                          if (value.token != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home(service: login)),
                            );
                            setState(() {
                              loading = false;
                            });
                          } else {
                            print(value.message);
                            setState(() => loading = false);
                            final snakbar = SnackBar(
                                content: Text(value.message.toString()));
                            ScaffoldMessenger.of(context).showSnackBar(snakbar);
                          }
                        });
                      }),
                  PrimaryButton(
                      TextButton: "Login",
                      ButtonColor: kPrimaryColor,
                      TextColor: kWhiteColor,
                      onPressed: () {
                        setState(() {
                          loading = true;
                        });
                        // widget.onChange(true);

                        loginrequest.username = myControllerUsername.text;
                        loginrequest.password = myControllerPassword.text;
                        login.login(loginrequest).then((value) {
                          if (value.token != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home(service: login)),
                            );
                            setState(() {
                              loading = false;
                            });
                          } else {
                            print(value.message);
                            setState(() => loading = false);
                            final snakbar = SnackBar(
                                content: Text(value.message.toString()));
                            ScaffoldMessenger.of(context).showSnackBar(snakbar);
                          }
                        });
                      }),
                ],
              ),
            )

            // LoginButton(
            //     ButtonColor: kPrimaryColor,
            //     T: kWhiteColor,
            //     TextButton: 'Login',
            //     onPressed: () {

            //       loginrequest.username = myControllerUsername.text;
            //       loginrequest.password = myControllerPassword.text;
            //       setState(() => loading = true);
            //       loginservice.Login(loginrequest).then((value) {
            //         if (value.token != null) {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(builder: (context) => HomePage()),
            //           );
            //         } else {
            //           print(value.message);
            //         }

            //       }

            // );
            //     }),
          ],
        ),
      ),
    );

    // Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     ClipRRect(
    //       borderRadius: BorderRadius.all(
    //         Radius.circular(20),
    //       ),
    //       child: Container(
    //         height: MediaQuery.of(context).size.height * 0.5,
    //         width: MediaQuery.of(context).size.width * 0.8,
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //         ),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: <Widget>[
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: <Widget>[
    //                 // Text(
    //                 //   'Login Here',
    //                 //   style: GoogleFonts.poppins(
    //                 //     textStyle: style,
    //                 //     fontSize: 25,
    //                 //     fontWeight: FontWeight.w700,
    //                 //     letterSpacing: 1,
    //                 //     color: Color.fromARGB(255, 28, 28, 28),
    //                 //   ),
    //                 // ),
    //               ],
    //             ),
    //             _buildEmailRow(),
    //             _ForgotPasswordButton(),
    //             SizedBox(
    //               height: 5,
    //             ),

    //             LoginButton(
    //               TextButton: 'Login',
    //               onPressed: () {
    //                 loginrequest.username = myControllerUsername.text;
    //                 loginrequest.password = myControllerPassword.text;
    //                 setState(() => loading = true);
    //                 loginservice.login(loginrequest).then((value) {
    //                   if (value.token != null) {
    //                     Navigator.push(
    //                       context,
    //                       MaterialPageRoute(builder: (context) => Home()),
    //                     );
    //                     setState(() {
    //                       loading = false;
    //                     });
    //                   } else {
    //                     print(value.message);
    //                     setState(() => loading = false);
    //                     final snakbar =
    //                         SnackBar(content: Text(value.message.toString()));
    //                     ScaffoldMessenger.of(context).showSnackBar(snakbar);
    //                   }
    //                 });
    //               },
    //               colorB: kPrimaryColor,
    //               colorT: kWhiteColor,
    //             ),

    //             // // _buildLoginButton(),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }

  Widget _buildEmailRow() {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Form(
            key: globalFormKey,
            child: Column(
              children: [
                TextFormField(
                    controller: myControllerUsername,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        color: kTextFieldColor,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                    )),
                TextFormField(
                    obscureText: _isObscure,
                    controller: myControllerPassword,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.password,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: kTextFieldColor,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: _isObscure
                            ? Icon(
                                Icons.visibility_off,
                                color: kTextFieldColor,
                              )
                            : Icon(
                                Icons.visibility,
                                color: kPrimaryColor,
                              ),
                      ),
                    ))
              ],
            )));
    //   return Padding(padding: EdgeInsets.all(8),
    //   child: TextFormField(
    //     keyboardType: TextInputType.text,
    //     obscureText: true,
    //     onChanged: (value ){
    //       setState(() {
    //          email = value;
    //       });
    //     },
    //     decoration: InputDecoration(
    //       prefixIcon: Icon(
    //         Icons.person,
    //         color: Color(0xFFe9533c),
    //       ),
    //       labelText:'Username',
    //     ),
    //   ),
    //   );
    // }
    // Widget _buildPasswordRow(){
    //   return Padding(padding: EdgeInsets.all(8),
    //   child: TextFormField(
    //     keyboardType: TextInputType.text,
    //     obscureText: passwordObsecured,
    //     onChanged: (value ){
    //       setState(() {
    //          password = value;
    //       });
    //     },
    //     decoration: InputDecoration(
    //       prefixIcon: Icon(
    //         Icons.password,
    //         color: Color(0xFFe9533c),
    //       ),
    //       labelText:'Password',
    //       suffixIcon: IconButton(onPressed: (){
    //         setState(() {
    //           passwordObsecured = !passwordObsecured;
    //         });
    //       },
    //       icon: Icon(
    //         passwordObsecured?
    //         Icons.visibility_off: Icons.visibility),
    //     ),
    //   ),
    //   ));
  }

  Widget _ForgotPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Forgot(),
                  ));
            },
            child: Text(
              'Forgot Password?',
              style: GoogleFonts.poppins(
                textStyle: style,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
                color: Color.fromARGB(255, 115, 114, 114),
              ),
            )),
      ],
    );
  }

  // Widget _buildLoginButton(){
  // return Row(
  // mainAxisAlignment: MainAxisAlignment.center,
  // children: <Widget> [
  //   Container(
  //     height: 1.4 * (MediaQuery.of(context).size.height / 20),
  //     width: 5 * (MediaQuery.of(context).size.width / 10),
  //     margin: EdgeInsets.only(bottom: 20),
  //     child: RaisedButton(
  //       elevation: 5,
  //       color: Color(0xFFe9533c),
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //       onPressed: (){
  //         print("press");
  //         print(myControllerUsername);
  //         print(myControllerUsername);
  //       },
  //       child:  Text(
  //                   'Login',
  //                   style: GoogleFonts.poppins(
  //                     textStyle: style,
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.w700,
  //                     letterSpacing: 1,
  //                     color: Color.fromARGB(255, 255, 255, 255),
  //                   ),
  //                   )
  //     ),
  //   ),
  // ],
  // );
  // }
  Widget _SignUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 40),
          child: FlatButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ));
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Dont have an account?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 115, 114, 114),
                      fontSize: MediaQuery.of(context).size.height / 40,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                      color: Color(0xFFe9533c),
                      fontSize: MediaQuery.of(context).size.height / 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : SafeArea(
            child: Scaffold(
              drawer: SideBar(service: login),
              appBar: AppBar(
                title: Text("Kaira's Group",
                    style: TextStyle(color: kPrimaryColor)),
                centerTitle: true,
                backgroundColor: kPrimaryWhiteColor,
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
              resizeToAvoidBottomInset: false,
              backgroundColor: kPrimaryColor,
              body: Stack(
                children: <Widget>[
                  // Container(
                  //   height: MediaQuery.of(context).size.height * 0.5,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: Color(0xFFe9533c),
                  //       borderRadius: BorderRadius.only(
                  //         bottomLeft: Radius.circular(70),
                  //         bottomRight: Radius.circular(70),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //    _buildlogo(),
                      _BuildContainer(),
                      //  _SignUpButton(),
                    ],
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.home),
                onPressed: () {},
                backgroundColor: kPrimaryColor,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomNavBar(),
            ),
          );
  }
}


// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);
//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final style = TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
//   final myControllerUsername = TextEditingController();
//   final myControllerPassword = TextEditingController();
//   LoginRequestModel loginrequest = LoginRequestModel();
//   GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
//   bool loading = false;

//   Widget _BuildContainer() {
//     return Material(
//       child: Container(
//         alignment: Alignment.centerLeft,
//         height: MediaQuery.of(context).size.height * 0.45,
//         width: MediaQuery.of(context).size.width * 0.8,
//         decoration: BoxDecoration(
//             color: kWhiteColor,
//             borderRadius: const BorderRadius.all(
//               Radius.circular(20),
//             )),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Login Here',
//               style: GoogleFonts.poppins(
//                 textStyle: style,
//                 fontSize: 25,
//                 fontWeight: FontWeight.w600,
//                 letterSpacing: 1,
//                 color: kBlackColor,
//               ),
//             ),
//             LogInForm(
//                 controllerUsername: myControllerUsername,
//                 controllerPassword: myControllerPassword),
//             Align(
//               alignment: Alignment.topLeft,
//               child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: InkWellCustom(
//                     TextSimple: 'Forgot Password?',
//                     Textsize: 14,
//                     Hoversize: 14,
//                     TextColor: kDarkGreyColor,
//                     HoverColor: kPrimaryColor),
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),

//             PrimaryButton(
//                 TextButton: "Login",
//                 ButtonColor: kPrimaryColor,
//                 TextColor: kWhiteColor,
//                 onPressed: () {
//                   setState(() {
//                     loading = true;
//                   });
//                   LoginService login = LoginService();
//                   loginrequest.username = myControllerUsername.text;
//                   loginrequest.password = myControllerPassword.text;
//                   login.Login(loginrequest).then((value) {
//                     if (value.token != null) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => HomePage()),
//                       );
//                       setState(() {
//                         loading = false;
//                       });
//                     } else {
//                       print(value.message);
//                       setState(() => loading = false);
//                       final snakbar =
//                           SnackBar(content: Text(value.message.toString()));
//                       ScaffoldMessenger.of(context).showSnackBar(snakbar);
//                     }
//                   });
//                 }),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return loading
//         ? Loading()
//         : SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Container(
//                 decoration: BoxDecoration(color: kPrimaryWhiteColor),
//                 child: Stack(
//                   children: <Widget>[
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.5,
//                       width: MediaQuery.of(context).size.width,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: kPrimaryColor,
//                           borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(70),
//                             bottomRight: Radius.circular(70),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(height: 50),
//                         Logo(),
//                         LoginContainer(
//                             loading: loading,
//                             controllerUsername: myControllerUsername,
//                             controllerPassword: myControllerPassword),

//                         // _BuildContainer(),
//                         ShiftCustom(
//                             SimpleText: 'Dont have an account?',
//                             TextColor: kZambeziColor,
//                             InkText: 'Sign Up',
//                             InkTextColor: kPrimaryColor,
//                             InkTextHoverColor: sPlash2,
//                             InkTextSize: 16,
//                             InkTextHoverSize: 16),
//                         // _SignUpButton(),
//                         SizedBox(height: 100)
//                       ],
//                     ),
//                   ],
//                 ))
//             // ),
//             );
//   }
// }
