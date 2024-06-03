import 'package:exam/core/config/get_it_configer.dart';
import 'package:exam/core/res/app_string.dart';
import 'package:exam/core/res/color/color_palyt.dart';
import 'package:exam/core/res/style/app_style.dart';
import 'package:exam/model/chat_model.dart';
import 'package:exam/pages/invate_page.dart';
import 'package:exam/pages/logIn_page.dart';
import 'package:exam/service/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  List<ChatModel> result = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
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
                        //core.get<SharedPreferences>().clear();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InvitePage()));
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
          ),
          Expanded(
            flex: 4,
            child: FutureBuilder(
              future: ChatServiceImp().getChat(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ChatModel> chat = snapshot.data as List<ChatModel>;
                  result = chat;
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Column(
                        children: [
                          Container(
                            color: BackgroundColor,
                            width: 550,
                            height: 40,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 300,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 40),
                                      child: TextField(
                                        onChanged: (value) {
                                          result = [];
                                          setState() {
                                            chat.forEach(
                                              (element) {
                                                if (element.name
                                                    .contains(value)) {
                                                  result.add(element);
                                                }
                                              },
                                            );
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintStyle: styletitelSearch,
                                          hintText: "search here ...",
                                          prefixIcon: const Icon(Icons.search,
                                              color: ButtomColor),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: BackgroundColor,
                            height: 405,
                            width: 550,
                            child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 362,
                                  height: 54,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          snapshot.data![index].image),
                                    ),
                                    title: Text(snapshot.data![index].name,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: praimaryColor)),
                                    subtitle: Text(
                                      snapshot.data![index].message,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Color(0xFF9C9797),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else
                  return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
