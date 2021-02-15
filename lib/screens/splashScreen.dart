import 'dart:async';

import 'package:firebase_user_login/authentication/ExpertRegister.dart';
import 'package:firebase_user_login/screens/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_user_login/authentication/Login.dart';
import 'package:firebase_user_login/Widgets/Apptitle.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    displaySplash();
  }

  displaySplash() {
    Timer(Duration(seconds: 10000), () async {
      Route route = MaterialPageRoute(builder: (_) => LoginScreen());

      Navigator.pushReplacement(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    double _screenwidth = MediaQuery.of(context).size.width,
        _screenheight = MediaQuery.of(context).size.height;
    return Material(
      child: Container(
        decoration: new BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: _screenheight * 0.15,
              ),
              apptitle("Profit", "Plug", 34, 28),
              Padding(
                padding: const EdgeInsets.fromLTRB(140, 0, 140, 0),
                child: Divider(
                  thickness: 2,
                  color: Colors.red,
                ),
              ),
              Text(
                "You design it We made it",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                height: _screenheight * 0.08,
              ),
              SizedBox(
                height: _screenheight * 0.10,
              ),
              Container(
                width: _screenwidth * 0.8,
                height: _screenheight * 0.07,
                child: Material(
                  borderRadius: BorderRadius.circular(25.0),
                  shadowColor: Colors.greenAccent,
                  color: Colors.green,
                  elevation: 1.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return LoginScreen();
                      }));
                    },
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
