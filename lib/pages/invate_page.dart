//import 'package:exam/core/config/get_it_configer.dart';
import 'package:exam/core/res/app_string.dart';
import 'package:exam/core/res/color/color_palyt.dart';
import 'package:exam/core/res/style/app_style.dart';
//import 'package:exam/model/chat_model.dart';
import 'package:exam/pages/chat_page.dart';
//import 'package:exam/pages/logIn_page.dart';
//import 'package:exam/service/chat_service.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class InvitePage extends StatelessWidget {
  InvitePage({super.key});
  TextEditingController codecontroller = TextEditingController();
  GlobalKey<FormState> codeKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: secondryColor,
              width: double.maxFinite,
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(),
                        )),
                    child: Container(
                      margin: const EdgeInsets.only(left: 35),
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: BackgroundColor),
                      child: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: praimaryColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(INVITEFRIENDS, style: titelChatPageStyle),
                  const Spacer(),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      margin: const EdgeInsets.only(right: 35),
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: BackgroundColor),
                      child: const Icon(
                        Icons.delete,
                        color: praimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Form(
              key: codeKey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Image.asset("images/gift.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(INVITEFRIEND, style: titelinbuttom),
                  ),
                  Text(INVITEMESSAGE, style: inviteMessageStyle),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 60, right: 60, top: 20,bottom: 8),
                    child: TextFormField(
                      // enabled: true,
                      controller: codecontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This field is Empty";
                        }
                      },

                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ButtomColor)),
                        hintText: SHARECODE,
                        hintStyle: inviteCodeStyle,
                        filled: true,
                        fillColor: secondryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 328,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ButtomColor),
                        child: Center(child: Text(INVITEFRIENDS,style:codeButtom)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
