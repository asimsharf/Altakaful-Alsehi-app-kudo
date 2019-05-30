import 'dart:async';
import 'dart:convert';

import '../models/user.dart';
import '../utils/network_util.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "http://23.111.185.155:4000/takaful/api";
  static final LOGIN_URL = BASE_URL + "/client_login";
  //static final _API_KEY = "somerandomkey";

  Future<User> login(String username, String password) {
    var FormData = {
      //"token": _API_KEY,
      "username": username,
      "password": password
    };

    String ToJson = jsonEncode(FormData);

    print(ToJson);

    return _netUtil.post(LOGIN_URL, body: ToJson).then((dynamic res) {
      print(res.toString());

      if (res["error"]) throw new Exception(res["error_msg"]);

      return new User.map(res["user"]);
    });
  }
}
