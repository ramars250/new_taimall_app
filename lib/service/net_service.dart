import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_taimall_app/models/member_model.dart';
import 'package:new_taimall_app/pages/member_screen.dart';

final headers = {
  "Content-Type": "application/json",
  "ApiKey": "aaaaaaaabbbbbbbbcccccccc"
};

Future getApiData(url) async {
  http.Response response = await http.get(url, headers: headers);
  // print(response.body);
  if (response.statusCode != 200) {
    throw Exception('Error');
  }
}

Future getApiMemberData(url) async {
  http.Response response = await http.get(url, headers: headers);
  if (response.statusCode == 200) {
    MemberData memberPointData = MemberData.fromJson(
      json.decode(response.body),
    );
    // print(memberPointData);
    return const MemberScreen();
  } else {
    throw Exception('Error');
  }
}

