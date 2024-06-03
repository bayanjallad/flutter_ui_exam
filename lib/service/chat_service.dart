import 'package:dio/dio.dart';
import 'package:exam/model/chat_model.dart';

abstract class ChatService {
  Dio dio = Dio();
  late Response response;
  String baseUrl = "https://664dcb37ede9a2b55654e96c.mockapi.io/api/v1/people";
  Future<List<ChatModel>> getChat();
}

class ChatServiceImp extends ChatService {
  @override
  Future<List<ChatModel>> getChat() async {
    try {
    response = await dio.get(baseUrl);
    print(response.data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      List<ChatModel> chatList = List.generate(
        response.data.length,
        (index) => ChatModel.fromJson(
          response.data[index],
        ),
      );
      return chatList;
    } else {
      return [];
    }
      
    }on DioException catch (e) {
      print(e.message);
      return[];
      
    }
  }
}
