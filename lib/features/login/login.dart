import 'package:crisis_app/common/custom_text_field.dart';
import 'package:crisis_app/features/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login-screen";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = true;

  Future<bool> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final cred = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
      await FirebaseAuth.instance.signInWithCredential(cred);
      print("Login Success");
      return true;
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomInputField(
                  hintText: 'Email',
                  labelText: 'Email',
                  controller: _emailController,
                  icon: Icons.email,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomInputField(
                  hintText: 'Password',
                  labelText: 'Password',
                  isPassword: true,
                  controller: _passwordController,
                  icon: Icons.password,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      )
                          .then((value) {
                        if (kDebugMode) {
                          print("New Account Created");
                        }
                        Navigator.pushNamed(
                          context,
                          HomeScreen.routeName,
                        );
                      }).onError((error, stackTrace) {
                        Fluttertoast.showToast(
                          msg: "Incorrect combination of email and password",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                        );
                      });
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () async {
                     Future<bool> auth = loginWithGoogle();
                    },
                    child: const Text(
                      "SignIn with Google",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
