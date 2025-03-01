import "package:crisis_app/common/bottom_bar.dart";
import "package:crisis_app/common/custom_button.dart";
import "package:crisis_app/common/custom_text_field.dart";
import "package:crisis_app/features/home/home.dart";
import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/foundation.dart";

class RegisterPage extends StatefulWidget {
  static const String routeName = "/register-screen";
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _stateController = TextEditingController();
  final _cityController = TextEditingController();
  final _ageController = TextEditingController();
  final _mainCropsController = TextEditingController();
  final _landAreaController = TextEditingController();
  bool _isLoading = false;

  Future<void> _registerUser() async {
    // if (_formKey.currentState!.validate()) {
    try {
      setState(() {
        _isLoading = true;
      });
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // await FirebaseFirestore.instance
      //     .collection('users')
      //     .doc(userCredential.user?.uid)
      //     .set({
      //   'name': _nameController.text,
      //   'email': _emailController.text,
      //   'phone': _phoneController.text,
      //   'state': _stateController.text,
      //   'city': _cityController.text,
      //   'age': _ageController.text,
      //   'main_crops': _mainCropsController.text,
      //   'land_area': _landAreaController.text,
      // });
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacementNamed(
        context,
        HomeScreen.routeName,
      );
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (kDebugMode) {
        print("Error during registration: $e");
      }
    }
    // }
  }

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
                  controller: _nameController,
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
                    onPressed: _isLoading ? null : _registerUser,
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "Register",
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    _ageController.dispose();
    _mainCropsController.dispose();
    _landAreaController.dispose();
    super.dispose();
  }
}
