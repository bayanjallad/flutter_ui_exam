import 'package:exam/core/config/get_it_configer.dart';
import 'package:exam/core/res/color/color_palyt.dart';
import 'package:exam/core/res/style/app_style.dart';
import 'package:exam/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  GlobalKey<FormState> Key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: Container(
        child: Form(
          key: key,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 137, bottom: 40),
                child: Text(
                  "r i i d e",
                  style: styleRiide,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  "Welcom to RIIDE",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 350, bottom: 7),
                child: Text(
                  "USERNAME",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 9,
                      color: Color(0xFFCDCDCD)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  onChanged: (value) {
                    core.get<SharedPreferences>().setString("User Name", value);
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Email or User Name",
                    filled: true,
                    fillColor: secondryColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 350, bottom: 7, top: 20),
                child: const Text(
                  "PASSWORD",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 9,
                      color: Color(0xFFCDCDCD)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    filled: true,
                    fillColor: secondryColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, bottom: 7, top: 10),
                    child: Text(
                      "Remmember me",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 9,
                          color: Color(0xFFCDCDCD)),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 22),
                    child: Text(
                      "forget Password",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 9,
                          color: Color(0xFF1DAEFF)),
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(),
                    )),
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Center(
                      child: Text("signin",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 11,
                              color: Colors.white))),
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Color(0xFF4CE5B1),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 110),
                child: Row(
                  children: [
                    Text(
                      "Dont have an account?",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: MessageColor),
                    ),
                    Text(
                      "Sign up",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color(0xFF1DAEFF)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
