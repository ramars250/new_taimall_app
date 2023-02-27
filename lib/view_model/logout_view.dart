import 'package:new_taimall_app/service/api.dart';
import 'package:new_taimall_app/service/net_service.dart';

void logout() {
  var url = Uri.parse(Api.Devices_logout);
  goMemberLogout(url);
}