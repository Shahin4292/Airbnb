import 'package:airbnb_app/service/authentication/google_and_firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'main_home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Log in or sign up",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome to Airbnb",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  // for phone number field,
                  phoneNumberField(size),
                  const SizedBox(height: 10),
                  RichText(
                    text: const TextSpan(
                      text:
                          "We'll call or text you to confirm your number. Standard message and data rates apply. ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.pink,
                    ),
                    child: const Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.026),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.black26,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "or",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.black26,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.015),
                  socialIcons(
                    size,
                    Icons.facebook,
                    "Continue with Facebook",
                    Colors.blue,
                    30,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () async {
                      await FirebaseAuthService().signInWithGoogle();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainHomeScreen(),
                        ),
                      );
                    },
                    child: socialIcons(
                      size,
                      FontAwesomeIcons.google,
                      "Continue with Google",
                      Colors.pink,
                      27,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  socialIcons(
                    size,
                    Icons.apple,
                    "Continue with Apple",
                    Colors.black,
                    30,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  socialIcons(
                    size,
                    Icons.email_outlined,
                    "Continue with email",
                    Colors.black,
                    30,
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      "Need help?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container socialIcons(Size size, icon, name, color, double iconSize) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: 11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(),
      ),
      child: Row(
        children: [
          SizedBox(width: size.width * 0.05),
          Icon(
            icon,
            color: color,
            size: iconSize,
          ),
          SizedBox(width: size.width * 0.18),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Container phoneNumberField(Size size) {
    return Container(
      width: size.width,
      height: 130,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black45,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: 10,
              left: 10,
              top: 8,
            ),
            child: Column(
              children: [
                Text(
                  "Country/Regin",
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "BD(+880)",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_sharp,
                      size: 30,
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Phone number",
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
