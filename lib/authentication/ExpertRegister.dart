import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_user_login/Widgets/customTextField.dart';
import 'package:firebase_user_login/Widgets/socal_card.dart';
import 'package:firebase_user_login/authentication/ExpertDetails.dart';
import 'package:email_validator/email_validator.dart';
//import 'package:profitflug/screens/splashScreen.dart';

//import 'AddAddress.dart';

class ExpertRegisterScreen extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

TextEditingController expertfirstnameTextEditingController =
    TextEditingController();
TextEditingController expertlastnameTextEditingController =
    TextEditingController();
TextEditingController expertemailTextEditingController =
    TextEditingController();
TextEditingController expertpasswordTextEditingController =
    TextEditingController();
TextEditingController expertphoneTextEditingController =
    TextEditingController();

class _RegisterState extends State<ExpertRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    double _screenwidth = MediaQuery.of(context).size.width,
        _screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
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
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: _screenheight * 0.1,
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
                              Colors.indigo[200],
                              Colors.white,
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
                                "Register",
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
                          child: customTextField("First Name", false,
                              expertfirstnameTextEditingController),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customTextField("Last Name", false,
                              expertlastnameTextEditingController),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customTextField(
                              "Email", false, expertemailTextEditingController),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customTextField("Password", true,
                              expertpasswordTextEditingController),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customTextField(
                              "Phone", false, expertphoneTextEditingController),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            child: RaisedButton(
                              color: Colors.white,
                              onPressed: () {
                                if (expertfirstnameTextEditingController.text !=
                                        '' &&
                                    expertlastnameTextEditingController.text !=
                                        '' &&
                                    expertemailTextEditingController.text !=
                                        '' &&
                                    expertpasswordTextEditingController.text !=
                                        '' &&
                                    expertphoneTextEditingController.text !=
                                        '') {
                                  if (EmailValidator.validate(
                                      expertemailTextEditingController.text)) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                      return ExpertDetailsScreen();
                                    }));
                                  }
                                }
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
                                        "Next Step",
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
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Divider(
                                color: Colors.black,
                              ),
                              Text(
                                "Or",
                                style: TextStyle(fontSize: 20),
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: _screenheight * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SocalCard(
                              icon: "assets/google-icon.svg",
                              press: () {},
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
                          height: _screenheight * 0.3,
                        )
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
}
