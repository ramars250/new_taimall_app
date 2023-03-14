import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_taimall_app/service/api.dart';
import 'package:new_taimall_app/service/net_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var url = Uri.parse(Api.Devices_logout);
  var deviceType = prefs.getString('DeviceType');
  goMemberLogout(url, deviceType);
  prefs.clear();
  Api().getMemGuid = '';
}

Future goMemberLogout(url, deviceType) async {

  final json = jsonEncode({
    "DeviceType": deviceType,
    "PushToken": '',
  });
  http.Response response = await http.put(url, headers: headers, body: json);
  if (response.statusCode == 200) {
    return ;
  }
}
