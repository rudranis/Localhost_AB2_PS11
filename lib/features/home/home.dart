import 'package:crisis_app/common/custom_button.dart';
import 'package:crisis_app/features/login/login.dart';
import 'package:flutter/material.dart';

import '../register/register.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home-screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 50, top: 60, right: 50),
            child: const Text(
              "Humanitarian Crisis Relief and Support",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: height * .05,
          ),
          ClipOval(
            child: Image.asset(
              "assets/ngo.jpg",
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: height * .05,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                buttonText: "Register as User",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RegisterPage.routeName,
                  );
                },
              ),
              CustomButton(
                buttonText: "Register as Organization",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RegisterPage.routeName,
                  );
                },
              ),
              CustomButton(
                buttonText: "Login",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    LoginPage.routeName,
                  );
                },
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
