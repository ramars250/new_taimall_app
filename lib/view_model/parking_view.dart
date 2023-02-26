import 'package:new_taimall_app/service/api.dart';
import 'package:new_taimall_app/service/net_service.dart';

void parkingData() {
  var url = Uri.parse(Api.PARKING_Info);
  getApiData(url);
}
