import 'package:exam/core/res/app_string.dart';
import 'package:exam/core/res/color/color_palyt.dart';
import 'package:exam/core/res/style/app_style.dart';
import 'package:exam/model/chat_model.dart';
import 'package:exam/pages/invate_page.dart';
import 'package:exam/pages/logIn_page.dart';

import 'package:exam/service/chat_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  List<ChatModel> result = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          builder: (context) => InvitePage(),
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
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LogInPage(),
                        )),
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
            child: Container(
              width: double.maxFinite,
              color: BackgroundColor,
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
                              width: 380,
                              height: 42,
                              //color:secondryColor ,
                              margin:
                                  const EdgeInsets.only(top: 30, bottom: 10),
                              child: TextField(
                                onChanged: (value) {
                                  result = [];
                                  setState(() {
                                    chat.forEach((element) {
                                      if (element.name.contains(value)) {
                                        result.add(element);
                                      }
                                    });
                                  });
                                },
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search),
                                  prefixIconColor: ButtomColor,
                                  hintText: "    Search here ...",
                                  suffixIcon: const Icon(Icons.mic_rounded),
                                  suffixIconColor: MessageColor,
                                  hintStyle: styletitelSearch,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ButtomColor,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: secondryColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 450,
                              child: ListView.builder(
                                itemCount: result.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(top: 10, left: 20),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            result[index].image),
                                      ),
                                      title: Row(
                                        children: [
                                          Text(result[index].name,
                                              style: contactNameStyle),
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: LetterColor),
                                            child: Center(
                                              child: Text(
                                                  result[index]
                                                      .unreadMessageCount
                                                      .toString(),
                                                  style: unreadMessageStyle),
                                            ),
                                          )
                                        ],
                                      ),
                                      subtitle: Text(
                                        result[index].message,
                                        style: messageStyle,
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
                  } else {
                    return Column(
                      children: [
                        Container(
                          width: 380,
                          height: 42,
                          //color:secondryColor ,
                          margin: const EdgeInsets.only(top: 30, bottom: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              prefixIconColor: ButtomColor,
                              hintText: "    Search here ...",
                              suffixIcon: const Icon(Icons.mic_rounded),
                              suffixIconColor: MessageColor,
                              hintStyle: styletitelSearch,
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ButtomColor,
                                ),
                              ),
                              filled: true,
                              fillColor: secondryColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        const CircularProgressIndicator(),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
