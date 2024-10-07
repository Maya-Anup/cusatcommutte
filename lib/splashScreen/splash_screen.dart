import 'dart:async';

import 'package:carpooling_app/authentication/login_screen.dart';
import 'package:carpooling_app/authentication/signup_screen.dart';
import 'package:carpooling_app/mainScreen/main_screen.dart';
import 'package:carpooling_app/splashScreen/user_selection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global/global.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() async {
    Timer(const Duration(seconds: 4), () async {
      // if (await fAuth.currentUser != null) {
      //
      //   Navigator.push(context, MaterialPageRoute(builder: (c) => MainScreen()));
      //
      // }
      // else {
      //   Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
      // }
      //send user to home screen
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? islogged = prefs.getBool('islogged');
      if (islogged != null && islogged) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (c) => MainScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (c) => const UserSelection()));
      }
    }); //Timer
  }

  @override
  void initState() {
    //start when we enter a new page
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.1,
              ),
              Image.asset("assets/images/cusat.png",
                  height: MediaQuery.sizeOf(context).height * 0.2),
              Text(
                'CUSAT\nCOMMUTE',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.red[900],
                    shadows: [
                      Shadow(
                          offset: Offset(5, 5),
                          blurRadius: 15,
                          color: Colors.black54)
                    ],
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.sizeOf(context).width * 0.09),
              ),
              Spacer(
                flex: 5,
              ),
              Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[700]),
                  'Ride Together, Save Together\nConnecting CUSAT students for easy commutes.'),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
