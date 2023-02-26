import 'package:new_taimall_app/service/api.dart';
import 'package:new_taimall_app/service/net_service.dart';

void getLoginData(cell, pass) {
  var cellNem = cell;
  var passWd = pass;
  // print(cellNem);
  // print(passWd);
  var url = Uri.parse(Api.Devices_login);
  putApiData(url, cellNem, passWd);
}