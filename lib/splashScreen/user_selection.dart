import 'package:carpooling_app/authentication/login_screen.dart';
import 'package:flutter/material.dart';

class UserSelection extends StatelessWidget {
  const UserSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select the User :'),
            customtextbutton(context, 'Driver'),
            customtextbutton(context, 'User')
          ],
        ),
      ),
    ));
  }
}

Widget customtextbutton(BuildContext context, String text) {
  return MaterialButton(
      height: 40,
      minWidth: 100,
      color: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      },
      child: Text(text));
}
