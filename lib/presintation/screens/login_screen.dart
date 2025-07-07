import 'package:flutter/material.dart';
import 'package:note_app/core/colors/colors_manager.dart';

import '../widgets/text_form_filed_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45,
                vertical: 134,
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Hi, Welcome Back!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 44),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),),


                      TextFormFiledWidget(
                        hintTxt: 'example@gmail.com',
                        keyType: TextInputType.emailAddress,
                        controller: emailController,
                      ),
                      SizedBox(height: 44,),
                      Text("Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),),
                      TextFormFiledWidget(
                        hintTxt: 'Enter Your Password',
                        keyType: TextInputType.visiblePassword,
                        controller: passController,
                        suffIcon: Icon(Icons.visibility),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
