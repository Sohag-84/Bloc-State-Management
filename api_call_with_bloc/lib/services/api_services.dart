import 'dart:convert';

import 'package:api_call_with_bloc/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<UserModel>> getUser() async {
    List<UserModel> userList = [];
    String url = "https://jsonplaceholder.typicode.com/users";
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body.toString());
      for (var element in data) {
        UserModel userModel = UserModel.fromJson(element);
        userList.add(userModel);
      }
    }
    return userList;
    try {} catch (e) {
      throw e.toString();
    }
  }
}
