import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:new_taimall_app/models/member_model.dart';
import 'package:new_taimall_app/service/api.dart';

class MemberDetailScreen extends StatefulWidget {
  const MemberDetailScreen({Key? key}) : super(key: key);

  @override
  State<MemberDetailScreen> createState() => _MemberDetailScreenState();
}

class _MemberDetailScreenState extends State<MemberDetailScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, bottom: 5),
              alignment: Alignment.centerLeft,
              child: Text('午安! ${data?.memberName}'),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.purple,
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red),
                    margin: const EdgeInsets.only(left: 30, top: 20),
                    child: const Row(
                      children: [
                        Icon(Icons.qr_code_2),
                        Text(
                          '會員條碼',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 30),
                    child: Text('目前累計 NT${data?.thisYearAmount} 0元'),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: Colors.purple[700]),
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.stars),
                                Text(
                                  '目前累積點數',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            data?.points == null
                                ? const Text(
                                    '---點',
                                    style: TextStyle(fontSize: 18),
                                  )
                                : Text('${data?.points}點')
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
                                      '今年到期點數',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                data?.points == null
                                    ? const Text(
                                        '---點',
                                        style: TextStyle(fontSize: 18),
                                      )
                                    : Text('${data?.thisYearPoints}點')
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '綁定車號',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.car_crash),
                            Column(
                              children: [
                                Text(
                                  '車號',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Text('前往綁定'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.motorcycle),
                            Column(
                              children: [
                                Text(
                                  '車號',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Text('前往綁定'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('會員功能'),
                  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    children: List.generate(5, (index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('X'),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
