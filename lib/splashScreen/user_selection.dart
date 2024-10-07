import 'package:carpooling_app/authentication/car_info_screen.dart';
import 'package:carpooling_app/authentication/login_screen.dart';
import 'package:flutter/material.dart';

class UserSelection extends StatelessWidget {
  const UserSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/userselectionback.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select the user',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    shadows: [
                      Shadow(
                          color: Colors.white,
                          offset: Offset(4, 4),
                          blurRadius: 6)
                    ]),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.23,
              ),
              customtextbutton(context, 'Driver'),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.07,
              ),
              customtextbutton(context, 'User')
            ],
          ),
        ),
      ),
    ));
  }
}

Widget customtextbutton(BuildContext context, String text) {
  return MaterialButton(
      height: 80,
      minWidth: double.infinity,
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 3, color: Colors.black45),
        borderRadius: BorderRadius.circular(15),
      ),
      hoverColor: Colors.black26,
      elevation: 8,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ));
}
