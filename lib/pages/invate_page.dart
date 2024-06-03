import 'package:exam/core/config/get_it_configer.dart';
import 'package:exam/core/res/app_string.dart';
import 'package:exam/core/res/color/color_palyt.dart';
import 'package:exam/core/res/style/app_style.dart';
import 'package:exam/model/chat_model.dart';
import 'package:exam/pages/logIn_page.dart';
import 'package:exam/service/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InvitePage extends StatelessWidget {
  const InvitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: Column(
        children: [
          Container(
            color: secondryColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 90, left: 23, bottom: 90),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LogInPage(),
                        )),
                    child: Container(
                      // margin: EdgeInsets.only(left: 23, top: 90),
                      width: 48,
                      height: 48,
                      child: Icon(Icons.arrow_back_ios_new_sharp,
                          color: praimaryColor),
                      decoration: BoxDecoration(
                        color: BackgroundColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 75, right: 75),
                    width: 157,
                    height: 30,
                    child: Text(
                      INVITEFRIEND,
                      style: styletitelChatPage,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      core.get<SharedPreferences>().clear();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LogInPage()));
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      child: Icon(Icons.delete, color: praimaryColor),
                      decoration: BoxDecoration(
                        color: BackgroundColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset("assets/images/c.png"),
          Spacer(),
          Container(
            width: 306,
            child: Column(
              children: [
                Text(
                  "Invite Friends",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Colors.white),
                ),
                Text(
                  "Dolore dolore adipisicing elit excepteur consectetur\n eiusmod excepteur reprehenderit occaecat eu minim.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Colors.white),
                )
              ],
            ),
          ),
          Container(
            width: 324,
            height: 115,
            child: Text(
              "share your code",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Color(0xFFC5C5CF)),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFF161616),
            ),
          ),
          Container(
            width: 324,
            height: 115,
            child: Text(
              "invite friend",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Color(0xFFC5C5CF)),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFF4CE5B1),
            ),
          ),
        ],
      ),
    );
  }
}
