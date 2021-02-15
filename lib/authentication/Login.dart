import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_user_login/screens/HomeScreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_user_login/DialogBox/errorDialog.dart';
import 'package:firebase_user_login/Widgets/Apptitle.dart';
import 'package:firebase_user_login/Widgets/customTextField.dart';
import 'package:firebase_user_login/Widgets/socal_card.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:firebase_user_login/authentication/ExpertRegister.dart';



import 'package:firebase_user_login/authentication/google_sign_in/google_sign.dart';

class LoginScreen extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}




class _AuthenticationState extends State<LoginScreen> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController loginuseremailTextEditingController =
  TextEditingController();
  TextEditingController loginuserpasswordTextEditingController =
  TextEditingController();
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();

    double _screenwidth = MediaQuery
        .of(context)
        .size
        .width,
        _screenheight = MediaQuery
            .of(context)
            .size
            .height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.pinkAccent[100],
                      Colors.white,
                      Colors.indigo[200],
                      Colors.white,
                    ]),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: apptitle("Profit", "Plug", 35, 30),
                  ),
                  SizedBox(
                    height: _screenheight * 0.25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Colors.white,
                              Colors.white,
                              Colors.white,
                              Colors.pinkAccent[100],
                            ]),
                        boxShadow: [
                          BoxShadow(color: Colors.white, blurRadius: 20),
                        ],
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Welcome",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customTextField("username", false,
                              loginuseremailTextEditingController),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customTextField("password", true,
                              loginuserpasswordTextEditingController),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            child: RaisedButton(
                              color: Colors.white,
                              onPressed: () async {



                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.purple,
                                          Colors.lightBlueAccent
                                        ]),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Container(
                                  alignment: Alignment.center,
                                  constraints: BoxConstraints(
                                      maxWidth: _screenwidth * 0.75,
                                      minHeight: _screenheight * .075),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account ?  ",
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 18),
                              ),
                              InkWell(
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.greenAccent[400],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () async {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return ExpertRegisterScreen();
                                      }));
                                },
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: _screenheight * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SocalCard(
                              icon: "assets/google-icon.svg",
                              press: () {
                                SignIn().onGoogleSignIn(context);
                              },
                            ),
                            SocalCard(
                              icon: "assets/facebook-2.svg",
                              press: () {},
                            ),
                            SocalCard(
                              icon: "assets/twitter.svg",
                              press: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _screenheight * 0.1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  checkInput() {
    if (loginuseremailTextEditingController
        .text.isEmpty ||
        loginuserpasswordTextEditingController
            .text.isEmpty) {
      return ErrorAlertDialog(message: "Please write email and password",);
    }
  }
}