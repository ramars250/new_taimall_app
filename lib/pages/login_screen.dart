import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:new_taimall_app/main.dart';
import 'package:new_taimall_app/service/api.dart';
import 'package:new_taimall_app/service/net_service.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  String deviceType = '';

  final nameController = TextEditingController();
  final passController = TextEditingController();
  final focus1 = FocusNode();
  final focus2 = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width * 3 / 4,
            color: Colors.lightBlueAccent,
            child: TextField(
              keyboardType: TextInputType.number,
              autofocus: true,
              focusNode: focus1,
              decoration: const InputDecoration(
                labelText: "請輸入手機號碼",
                hintText: "請輸入手機號碼",
                prefixIcon: Icon(Icons.phone_android),
              ),
              controller: nameController,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width * 3 / 4,
            color: Colors.lightBlueAccent,
            child: TextField(
              obscureText: true,
              controller: passController,
              focusNode: focus2,
              decoration: const InputDecoration(
                labelText: "密碼",
                hintText: "請輸入密碼",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              focus1.unfocus();
              focus2.unfocus();
              putApiData(ref);
              checkFutureDone(context, ref);
            },
            child: const Text(
              '登入',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  Future putApiData(ref) async {
    var url = Uri.parse(Api.Devices_login);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (Platform.isIOS) {
      deviceType = 1.toString();
    } else if (Platform.isAndroid) {
      deviceType = 2.toString();
    }
    final json = jsonEncode({
      "DeviceType": deviceType,
      "PushToken": "",
      "CellPhone": '0921945420',
      "Password": '435146',
    });
    http.Response response = await http.put(url, headers: headers, body: json);
    if (response.statusCode == 200) {
      var successData = jsonDecode(response.body);
      prefs.setString('MemberGuid', successData['MemberGuid']);
      ref.read(memGuidProvider.notifier).state =
          successData['MemberGuid'].toString();
      Api().getMemGuid = successData['MemberGuid'].toString();
    } else {
      throw Exception('Error');
    }
    return Future.delayed(const Duration(seconds: 2), () {
      prefs.getString('MemberGuid') ?? '';
    });
  }

  checkFutureDone(context, ref) {
    putApiData(ref).whenComplete(() {
      return goIndex(context);
    });
  }

  goIndex(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyApp(),
      ),
    );
  }
}

// class LoginScreen1 extends StatefulWidget {
//   const LoginScreen1({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen1> createState() => _LoginScreen1State();
// }
//
// class _LoginScreen1State extends State<LoginScreen1> {
//   late String deviceType = '';
//
//   final nameController = TextEditingController();
//   final passController = TextEditingController();
//   final focus1 = FocusNode();
//   final focus2 = FocusNode();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             alignment: Alignment.center,
//             height: MediaQuery.of(context).size.height / 10,
//             width: MediaQuery.of(context).size.width * 3 / 4,
//             color: Colors.lightBlueAccent,
//             child: TextField(
//               keyboardType: TextInputType.number,
//               autofocus: true,
//               focusNode: focus1,
//               decoration: const InputDecoration(
//                 labelText: "請輸入手機號碼",
//                 hintText: "請輸入手機號碼",
//                 prefixIcon: Icon(Icons.phone_android),
//               ),
//               controller: nameController,
//             ),
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height / 10,
//             width: MediaQuery.of(context).size.width * 3 / 4,
//             color: Colors.lightBlueAccent,
//             child: TextField(
//               obscureText: true,
//               controller: passController,
//               focusNode: focus2,
//               decoration: const InputDecoration(
//                 labelText: "密碼",
//                 hintText: "請輸入密碼",
//                 prefixIcon: Icon(Icons.lock),
//               ),
//             ),
//           ),
//           TextButton(
//             onPressed: () {
//               focus1.unfocus();
//               focus2.unfocus();
//               putApiData();
//               checkFutureDone();
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //     builder: (context) => Api().getGuid(),
//               //   ),
//               // );
//             },
//             child: const Text(
//               '登入',
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future putApiData() async {
//     var url = Uri.parse(Api.Devices_login);
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (Platform.isIOS) {
//       deviceType = 1.toString();
//     } else if (Platform.isAndroid) {
//       deviceType = 2.toString();
//     }
//     final json = jsonEncode({
//       "DeviceType": deviceType,
//       "PushToken": "",
//       "CellPhone": nameController.text,
//       "Password": passController.text,
//     });
//     http.Response response = await http.put(url, headers: headers, body: json);
//     if (response.statusCode == 200) {
//       var successData = jsonDecode(response.body);
//       prefs.setString('MemberGuid', successData['MemberGuid']);
//       setState(() {
//         Api().getMemGuid = successData['MemberGuid'].toString();
//       });
//     } else {
//       throw Exception('Error');
//     }
//     return Future.delayed(const Duration(seconds: 2), () {
//       prefs.getString('MemberGuid') ?? '';
//     });
//   }
//
//   checkFutureDone() {
//     putApiData().whenComplete(() {
//       return goIndex();
//     });
//   }
//
//   goIndex() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const MyApp(),
//       ),
//     );
//   }
// }