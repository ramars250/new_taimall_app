import 'package:new_taimall_app/service/api.dart';
import 'package:new_taimall_app/service/net_service.dart';

void getMemberData() {
  var url = Uri.parse(Api.Members_summary);
  getApiMemberData(url);
}
