import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_taimall_app/service/api.dart';
import 'package:new_taimall_app/service/net_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final testProvider = Provider<SharedPreferences>((_) => throw UnimplementedError());

class LoginView {

  late String getGuid = '';
  late String deviceType = '';
  String sharedProvider = '';

  Future getLoginData(cell, pass) async {
    var cellNem = cell;
    var passWd = pass;
    var url = Uri.parse(Api.Devices_login);
    putApiData(url, cellNem, passWd);
  }

  Future putApiData(url, cell, pass) async {
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

      getGuid = successData['MemberGuid'];
      deviceType = deviceType;

      saveMemGuid();
    } else {
      throw Exception('Error');
    }
    return getGuid;
  }

  saveMemGuid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('DeviceType', deviceType);
    prefs.setString('MemberGuid', getGuid);
    sharedProvider = prefs.getString('MemberGuid')!;
    return sharedProvider;
  }

}
