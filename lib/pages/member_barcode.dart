// ignore_for_file: avoid_print, must_be_immutable
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class MemberBarcode extends StatelessWidget {
  String memberCode;
  String memberId;

  MemberBarcode({super.key, required this.memberCode, required this.memberId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dialog(
        insetPadding: const EdgeInsets.only(top: 50),
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  const Spacer(),
                  Container(
                    // margin: const EdgeInsets.only(top: 30, bottom: 10),
                    alignment: Alignment.center,
                    child: const Text('會員卡條碼'),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                height: MediaQuery.of(context).size.height / 5,
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
                      ),
                      margin: const EdgeInsets.only(left: 30, top: 20),
                      child: const Row(
                        children: [
                          Text(
                            'TaiMall Logo',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.only(right: 30),
                      child: const Text(
                        '一般會員',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.only(right: 30, bottom: 20),
                      child: const Text(
                        'MORE利會員卡',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(20),
                color: Colors.yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BarcodeWidget(
                      textPadding: 20,
                      data: memberCode,
                      barcode: Barcode.code128(),
                      drawText: false,
                      width: MediaQuery.of(context).size.width - 100,
                      height: 150,
                      padding: const EdgeInsets.only(top: 50, bottom: 20),
                    ),
                    Text(memberId),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
