// ignore_for_file: library_private_types_in_public_api

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

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentPage);
    _getData();
    super.initState();
  }

  _getData() async {
    var url = Uri.parse(
        'https://raw.githubusercontent.com/flutter/website/master/_data/gallery.json');
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);
    data['demos'].forEach((demo) {
      _urls.add(demo['thumbnail']);
    });
    setState(() {});
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
                });
              },
              itemBuilder: (context, index) {
                return Image.network(_urls[index]);
              },
            ),
    );
  }
}
