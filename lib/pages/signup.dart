import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qamar_zaman_kaira/pages/Login.dart';
import '../theme.dart';
import 'button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String u_name;
  late String f_name;
  late String l_name;
  late String _num;
  late String _cnic;
  late String _password;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildfirtname() {
    return Row(children: [
      Expanded(
        child: TextFormField(
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: kBlackColor,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 15),
              labelText: 'FirstName',
              labelStyle: TextStyle(
                color: kTextFieldColor,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
            ),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'first name is required';
              }
            },
            onSaved: (String? value) {
              f_name = value!;
            }),
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: TextFormField(
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: kBlackColor,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 15),
              labelText: 'LastName',
              labelStyle: TextStyle(
                color: kTextFieldColor,
              ),
            ),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'last name is required';
              }
            },
            onSaved: (String? value) {
              f_name = value!;
            }),
      )
    ]);
  }

  Widget _buildusername() {
    return TextFormField(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 15),
          labelText: 'UserName',
          labelStyle: TextStyle(
            color: kTextFieldColor,
          ),
          prefixIcon: Icon(
            Icons.person,
            color: kPrimaryColor,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'last name is required';
          }
        },
        onSaved: (String? value) {
          f_name = value!;
        });
  }

  Widget _buildphonenumber() {
    return TextFormField(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 15),
          labelText: 'Mobile No',
          labelStyle: TextStyle(
            color: kTextFieldColor,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 10, top: 15),
            child: Text(
              '+92 |',
              style: TextStyle(
                color: kBlackColor,
              ),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'first name is required';
          }
        },
        onSaved: (String? value) {
          f_name = value!;
        });
  }

  Widget _buildcnic() {
    return TextFormField(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 15),
          labelText: 'CNIC 34201-xxxxxxx-x',
          labelStyle: TextStyle(
            color: kTextFieldColor,
          ),
          prefixIcon: Icon(
            Icons.card_membership,
            color: kPrimaryColor,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'first name is required';
          }
        },
        onSaved: (String? value) {
          f_name = value!;
        });
  }

  Widget _buildpassword() {
    return TextFormField(
        decoration: InputDecoration(
          isDense: true,
          // contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'first name is required';
          }
        },
        onSaved: (String? value) {
          f_name = value!;
        });
  }

  Widget _buildCpassword() {
    return TextFormField(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 15),
          prefixIcon: Icon(
            Icons.password,
            color: kPrimaryColor,
          ),
          labelText: 'Confirm Password',
          labelStyle: TextStyle(
            color: kTextFieldColor,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'first name is required';
          }
        },
        onSaved: (String? value) {
          f_name = value!;
        });
  }

  Widget _SignUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ));
          },
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Already have an account?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 115, 114, 114),
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'Login',
                  style: TextStyle(
                    color: Color(0xFFe9533c),
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var style;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFf2f3f5),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFe9533c),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Center(
                child: Text(
                  'Become a member',
                  style: GoogleFonts.poppins(
                    textStyle: style,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                          key: _formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _buildfirtname(),
                              SizedBox(
                                height: 5,
                              ),
                              _buildusername(),
                              SizedBox(
                                height: 5,
                              ),
                              _buildcnic(),
                              SizedBox(
                                height: 5,
                              ),
                              _buildphonenumber(),
                              SizedBox(
                                height: 5,
                              ),
                              _buildpassword(),
                              SizedBox(
                                height: 5,
                              ),
                              _buildCpassword(),
                              SizedBox(
                                height: 10,
                              ),
                              LoginButton(
                                  colorB: kPrimaryColor,
                                  colorT: kWhiteColor,
                                  TextButton: 'Sign Up',
                                  onPressed: () {
                                    if (!_formkey.currentState!.validate()) {
                                      return;
                                    }
                                    _formkey.currentState!.save();
                                    print(f_name);
                                  }),
                            ],
                          )),
                    ),
                  ),
                  _SignUpButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
