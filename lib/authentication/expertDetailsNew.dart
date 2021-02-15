import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_user_login/Widgets/customTextField.dart';
import 'package:firebase_user_login/screens/LoginScreen.dart';




class ExpertDetailsScreenNew extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

TextEditingController expertaddressTextEditingController =
TextEditingController();
TextEditingController expertcollegenameTextEditingController =
TextEditingController();
TextEditingController expertstateTextEditingController =
TextEditingController();
TextEditingController expertcityTextEditingController = TextEditingController();
TextEditingController expertpinTextEditingController = TextEditingController();
TextEditingController expertqualificationTextEditingController =
TextEditingController();
TextEditingController expertfieldEditingController = TextEditingController();
TextEditingController expertwhyexpertTextEditingController =
TextEditingController();
TextEditingController expertphoneTextEditingController =
TextEditingController();
var currentInterestEx = 'Finance';

class _RegisterState extends State<ExpertDetailsScreenNew> {
  var _interestEx = ['Finance', 'Stock', 'Economics'];

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
                                "Enter Your Details",
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
                          child: customTextField("Address", false,
                              expertaddressTextEditingController),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customTextField("State/Province", false,
                              expertstateTextEditingController),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customTextField("City/Town", false,
                              expertcityTextEditingController),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customTextField("Pin code", false,
                              expertpinTextEditingController),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customTextField(
                              "Phone", false, expertphoneTextEditingController),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customTextField("Name of College", false,
                              expertcollegenameTextEditingController),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customTextField("Qualification", false,
                              expertqualificationTextEditingController),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customTextField(
                              "Field", false, expertfieldEditingController),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customTextField(
                              "Why do you want to become an expert ?",
                              false,
                              expertwhyexpertTextEditingController),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Interest:",
                              style: TextStyle(fontSize: 18),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton<String>(
                                  items: _interestEx
                                      .map((String dropDownStringInterest) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringInterest,
                                      child: Text(dropDownStringInterest),
                                    );
                                  }).toList(),
                                  onChanged: (String newInterestSelected) {
                                    _onInterestSelect(newInterestSelected);
                                  },
                                  value: currentInterestEx,
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            child: RaisedButton(
                              color: Colors.white,
                              onPressed: () async {
                                if (expertaddressTextEditingController.text !=
                                    '' &&
                                    expertcollegenameTextEditingController.text !=
                                        '' &&
                                    expertstateTextEditingController.text !=
                                        '' &&
                                    expertcityTextEditingController.text !=
                                        '' &&
                                    expertpinTextEditingController.text != '' &&
                                    expertqualificationTextEditingController
                                        .text !=
                                        '' &&
                                    expertfieldEditingController.text != '' &&
                                    expertwhyexpertTextEditingController.text !=
                                        '') {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return OtpLoginScreen();
                                      }));
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

  void _onInterestSelect(String newInterestSelected) {
    setState(() {
      currentInterestEx = newInterestSelected;
    });
  }
}
