import 'package:flutter/material.dart';
import 'package:new_taimall_app/view_model/banner_view.dart';

class BannerScerrn extends StatelessWidget {
  const BannerScerrn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      //設置高度
      height: MediaQuery.of(context).size.height / 4,
      //設置寬度
      width: MediaQuery.of(context).size.width,
      color: Colors.green,
      child: const BannerView()
    );
  }
}
