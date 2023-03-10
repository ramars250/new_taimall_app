import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_taimall_app/main.dart';
import 'package:new_taimall_app/models/member_model.dart';
import 'package:new_taimall_app/pages/login_screen.dart';
import 'package:new_taimall_app/pages/member_barcode.dart';
import 'package:new_taimall_app/pages/member_detail_screen.dart';
import 'package:new_taimall_app/service/api.dart';
import 'package:http/http.dart' as http;
import 'package:screen_brightness/screen_brightness.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemberScreen1 extends ConsumerWidget {
  const MemberScreen1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(sharedPreferencesProvider);
    return Text(data.getString('MemberGuid').toString());
  }
}

class MemberScreen extends StatefulWidget {
  const MemberScreen({Key? key}) : super(key: key);

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  @override
  void initState() {
    getMeData();
    super.initState();
  }

  MemberData? data;

  final headers = {
    "Content-Type": "application/json",
    "ApiKey": "aaaaaaaabbbbbbbbcccccccc"
  };

  getMeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('MemberGuid') != null) {
      var url = Uri.parse(Api.Members_summary);
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        setState(() {
          data = MemberData.fromJson(json.decode(response.body));
        });
      } else {
        throw Exception('Error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  const Row(
                    children: [
                      Icon(Icons.stars),
                      Text(
                        '??????????????????',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  data?.points == null
                      ? const Text(
                          '---???',
                          style: TextStyle(fontSize: 18),
                        )
                      : Text(
                          '${data?.points}???',
                          style: const TextStyle(fontSize: 18),
                        ),
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 6),
              Row(
                children: [
                  Column(
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.credit_card),
                          Text(
                            '?????????',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      data?.emoneyAmount == null
                          ? const Text(
                              '---???',
                              style: TextStyle(fontSize: 18),
                            )
                          : Text(
                              '${data?.emoneyAmount}???',
                              style: const TextStyle(fontSize: 18),
                            ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          data?.memberName == null
              ? Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 5, bottom: 5),
                  padding: const EdgeInsets.all(5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      '??????  ??????  ???  ??????  ??????',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              : Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        color: Colors.red,
                        padding: const EdgeInsets.all(5),
                        margin:
                            const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                        child: Row(
                          children: [
                            TextButton.icon(
                              label: const Text('????????????'),
                              icon: const Icon(Icons.qr_code_2),
                              onPressed: () {
                                ScreenBrightness().setScreenBrightness(1.0);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MemberBarcode(
                                      memberCode: data!.memberCode ?? '',
                                      memberId: data!.memberID ?? '',
                                    ),
                                  ),
                                );
                              },
                            ),
                            // Icon(Icons.qr_code_2),
                            // Text(
                            //   '????????????',
                            //   style: TextStyle(fontSize: 18),
                            // ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MemberDetailScreen()));
                        },
                        child: Container(
                          color: Colors.yellow,
                          padding: EdgeInsets.only(
                              right:
                                  MediaQuery.of(context).size.width * 3.4 / 7),
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            '${data?.memberName}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
