import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:voteme/Utils/apis.dart';
import 'package:voteme/Utils/userModel.dart';

class ApiFunctions {
  var baseClient = http.Client();

  Future<List> getAll() async {
    List userList = [];
    var uri = Uri.parse(ApiConstants.getAlluser);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body.toString());
      for (Map<String, dynamic> i in res) {
        userList.add(Voter.fromJson(i));
      }
      return userList;
    } else {
      return [];
    }
  }

  Future<dynamic> getOne(String id) async {
    var endpoint = ApiConstants.getOneuser + id;
    var uri = Uri.parse(endpoint);
    var response = await baseClient.get(uri);
    if (response.statusCode == 200) {
      return response.body.toString();
    } else {
      return "";
    }
  }

  Future<dynamic> createUser(Voter user) async {
    var head =
    ({"Accept": "application/json", "content-type": "application/json"});
    var _payload = jsonEncode(user);
    var endpoint = ApiConstants.createUser;
    var uri = Uri.parse(endpoint);
    var response = await baseClient.post(uri, headers: head, body: _payload);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body.toString();
    } else {
      return "";
    }
  }

  Future<String>? updateUser(Voter user, String id) async {
    var payload = welcomeToJson(user);
    var uri1 = ApiConstants.updateUser + id;
    print(uri1);
    var uri = Uri.parse(uri1);

    var head =
    ({"Accept": "application/json", "content-type": "application/json"});
    var response = await baseClient.put(uri, body: payload, headers: head);
    if (response.statusCode == 200) {
      return (response.body.toString().isNotEmpty)
          ? response.body.toString()
          : "";
    }

    return "";
  }

  Future<dynamic> deleteUser(String id) async {
    var endpoint = ApiConstants.deleteUser + id;
    var uri = Uri.parse(endpoint);
    print(uri);
    var response = await baseClient.delete(uri);
    if (response.statusCode == 200) {
      return response.body.toString();
    } else {
      return "";
    }
  }
}
