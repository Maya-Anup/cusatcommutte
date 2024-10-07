import 'package:carpooling_app/authentication/login_screen.dart';
import 'package:carpooling_app/global/global.dart';
import 'package:carpooling_app/splashScreen/splash_screen.dart';
import 'package:carpooling_app/splashScreen/user_selection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({Key? key}) : super(key: key);

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("Sign out"),
        onPressed: () async {
          fAuth.signOut();
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('islogged', false);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => UserSelection(),
              ));
        },
      ),
    );
  }
}
