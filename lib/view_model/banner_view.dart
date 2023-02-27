// ignore_for_file: library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BannerView extends StatefulWidget {
  const BannerView({super.key});

  @override
  _BannerViewState createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
  int _currentPage = 0;
  late PageController _pageController;
  final List _urls = [];
  late Timer _timer;

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentPage);
    _getData();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage == _urls.length - 1) {
        _currentPage = 0;
      } else {
        _currentPage++;
      }
      _pageController.animateToPage(_currentPage,
          duration: const Duration(milliseconds: 50), curve: Curves.easeInOut);
    });
    super.initState();
  }

  _getData() async {
    var url = Uri.parse(
        'https://www2.taimall.com.tw/tmgear/appinfo2.asmx/getinfo?&action=banner&data=201904160000&pid=954f61ce-bae5-41b5-bcc9-12adc0ca3922&version=v2');
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    for (var data in jsonData['Data']) {
      setState(() {
        _urls.add(data);
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _urls.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : PageView.builder(
              controller: _pageController,
              itemCount: _urls.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                  print(_urls[0]);
                });
              },
              itemBuilder: (context, index) {
                return Image.network(
                  _urls[index]['banner_image'],
                  fit: BoxFit.fill,
                );
              },
            ),
    );
  }
}
