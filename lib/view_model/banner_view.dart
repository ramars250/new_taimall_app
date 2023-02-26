import 'package:new_taimall_app/service/net_service.dart';
import 'package:new_taimall_app/service/api.dart';

void bannerData() {
  var url = Uri.parse(Api.PARKING_Info);
  getApiData(url);
}
