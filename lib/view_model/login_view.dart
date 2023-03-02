import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:new_taimall_app/service/api.dart';
import 'package:new_taimall_app/service/net_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginView with ChangeNotifier {
  Future getLoginData(cell, pass) async {
    var cellNem = cell;
    var passWd = pass;
    var url = Uri.parse(Api.Devices_login);
    putApiData(url, cellNem, passWd);
  }

  Future putApiData(url, cell, pass) async {
    String deviceType = '';
    if (Platform.isIOS) {
      deviceType = 1.toString();
    } else if (Platform.isAndroid) {
      deviceType = 2.toString();
    }
    final json = jsonEncode({
      "DeviceType": deviceType,
      "PushToken": "",
      "CellPhone": "$cell",
      "Password": "$pass",
    });
    http.Response response = await http.put(url, headers: headers, body: json);
    if (response.statusCode == 200) {
      var successData = jsonDecode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('MemberGuid', successData['MemberGuid']);
      prefs.setString('DeviceType', deviceType);
    } else {
      throw Exception('Error');
    }
  }
// void setParameter(String parameter) {
//   Api.memberGuid = parameter;
// }
}
