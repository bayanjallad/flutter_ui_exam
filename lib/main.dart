import 'package:exam/core/config/get_it_configer.dart';
import 'package:exam/pages/chat_page.dart';
import 'package:exam/pages/invate_page.dart';
import 'package:exam/pages/logIn_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
       core.get<SharedPreferences>().getString("User Name")==null? LogInPage():ChatPage(),
    );
  }
}










// import 'package:flutter/material.dart';
// import 'package:grouped_list/grouped_list.dart';
// import 'package:intl/intl.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   List<Message> messages = [
//     Message(
//         text: 'Yes Sure!',
//         date: DateTime.now().subtract(Duration(minutes: 1)),
//         isSentByMe: false),
//     Message(
//         text: 'Yes Sure!',
//         date: DateTime.now().subtract(Duration(minutes: 1)),
//         isSentByMe: false),
//     Message(
//         text: 'Yes Sure!',
//         date: DateTime.now().subtract(Duration(minutes: 1)),
//         isSentByMe: false),
//     Message(
//         text: 'Yes Sure!',
//         date: DateTime.now().subtract(Duration(minutes: 1)),
//         isSentByMe: false),
//   ];

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(

//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: Scaffold(
//         body: Column(
//           children: [
//             Expanded(
//               child: GroupedListView<Message, DateTime>(
//                 padding: EdgeInsets.all(8),
//                 reverse: true,
//                 order: GroupedListOrder.DESC,
//                 useStickyGroupSeparators: true,
//                 floatingHeader: true,
//                 elements: messages,
//                 groupBy: (message) => DateTime(
//                   message.date.year,
//                   message.date.month,
//                   message.date.day,
//                 ),
//                 groupHeaderBuilder: (Message message) => SizedBox(
//                   height: 40,
//                   child: Card(
//                     color: Theme.of(context).primaryColor,
//                     child: Padding(
//                       padding: EdgeInsets.all(8),
//                       child: Text(DateFormat.yMMMd().format(message.date)),
//                     ),
//                   ),
//                 ),
//                 itemBuilder: (context, Message message) => Align(
//                   alignment: message.isSentByMe
//                       ? Alignment.centerRight
//                       : Alignment.centerLeft,
//                   child: Card(
//                     elevation: 8,
//                     child: Padding(
//                       padding: EdgeInsets.all(12),
//                       child: Text(message.text),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               color: Colors.grey.shade300,
//               child: TextField(
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.all(12),
//                   hintText: 'Type your Message here ...',
//                 ),
//                 onSubmitted: (text) {
//                   final message = Message(
//                       text: text, date: DateTime.now(), isSentByMe: true);
//                   setState(() => messages.add(message));
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Message {
//   final String text;
//   final DateTime date;
//   final bool isSentByMe;
//   Message({required this.text, required this.date, required this.isSentByMe});
// }
