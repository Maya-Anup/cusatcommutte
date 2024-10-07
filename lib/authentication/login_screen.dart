import 'package:carpooling_app/global/global.dart';
import 'package:carpooling_app/mainScreen/main_screen.dart';
import 'package:carpooling_app/tabPages/home_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carpooling_app/authentication/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

final globalScaffoldKey = GlobalKey<ScaffoldState>();

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false; // For showing loading indicator
  String errorMessage = ''; // To show error message

  // Firebase authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Save the login state in SharedPreferences
  void saveLoginState(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('islogged', isLoggedIn);
  }

  // Function to handle sign in
  Future<void> signInWithEmailPassword() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Sign in using Firebase Authentication
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // If sign-in is successful
      if (userCredential.user != null) {
        saveLoginState(true); // Save login state as true
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(), // Navigate to the main screen
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle authentication errors
      if (e.code == 'user-not-found') {
        setState(() {
          errorMessage = 'No user found for that email.';
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          errorMessage = 'Incorrect password. Please try again.';
        });
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        setState(() {
          errorMessage = 'Invalid Login Credentials';
        });
      } else {
        setState(() {
          errorMessage = 'Error: ${e.message}';
        });
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalScaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Log-In',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
            ),
            const Divider(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            if (errorMessage.isNotEmpty) // Display error message if any
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            TextButton(
              onPressed: () {
                // Forgot password functionality can go here
              },
              style: TextButton.styleFrom(foregroundColor: Colors.black87),
              child: const Text('Forgot Password?'),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: isLoading
                    ? CircularProgressIndicator(
                        color: Colors
                            .white) // Show loading indicator while signing in
                    : const Text('Login'),
                onPressed: signInWithEmailPassword, // Call sign-in method
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Does not have an account?"),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 14),
                  ),
                  onPressed: () {
                    // Navigate to the signup screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
