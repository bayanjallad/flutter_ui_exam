import 'package:exam/core/config/get_it_configer.dart';
import 'package:exam/core/res/app_string.dart';
import 'package:exam/core/res/color/color_palyt.dart';
import 'package:exam/core/res/style/app_style.dart';
import 'package:exam/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  GlobalKey<FormState> KeyforLogin = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: Container(
        width: double.maxFinite,
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 137, bottom: 40),
                child: Padding(
                  padding: const EdgeInsets.only(left: 170),
                  child: Row(children: [
                    Text("r", style: styleRiideWord),
                    Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: Text("i", style: styleRiide2),
                    ),
                    Text("i", style: styleRiide2),
                    Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: Text("d", style: styleRiideWord),
                    ),
                    Text("e", style: styleRiideWord),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(WELCOMETORIIDE, style: subtitlelogin),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 350, bottom: 7),
                child: Text(USERNAME, style: StyleNote),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  // enabled: true,
                  controller: usernamecontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field is Empty";
                    }
                  },
                  // onChanged: (value) {
                  //   core
                  //       .get<SharedPreferences>()
                  //       .setString("User Name", value);
                  // },
                  decoration: InputDecoration(
                    // enabledBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(color: Colors.red)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ButtomColor)),

                    hintText: ENTEREMAILORUSERNAME,
                    hintStyle: styleMessageOnfield,
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
                child: Text(PASSWORD, style: StyleNote),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: passwordcontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field is Empty";
                    }
                  },
                   obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: ButtomColor)),
                    hintText: ENTERYOURPASSWORD,
                    hintStyle: styleMessageOnfield,
                    filled: true,
                    fillColor: secondryColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, bottom: 7, top: 10),
                    child: Text(REMMEMBERME, style: StyleNote),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: Text(FORGETPASSWORD, style: StyleNote2),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  core
                      .get<SharedPreferences>()
                      .setString("UserName", usernamecontroller.text);
                  print(core.get<SharedPreferences>().getString("UserName"));

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(),
                      ));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Center(
                    child: Text(SIGNIN, style: buttomStyle),
                  ),
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: ButtomColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 110),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Text(DONOTHAVEANACCOUNT, style: questionStyle),
                    ),
                    Text(SIGNUP, style: questionStyle2),
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
