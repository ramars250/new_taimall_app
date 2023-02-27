import 'package:flutter/material.dart';
import 'package:new_taimall_app/pages/login_screen.dart';
import 'package:new_taimall_app/pages/member_screen.dart';
import 'package:new_taimall_app/view_model/banner_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '台茂購物中心',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '台茂購物中心'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        leading: Transform.scale(
          scale: 1.5,
          child: IconButton(
            icon: const Icon(
              Icons.menu,
            ),
            onPressed: () {},
          ),
        ),
        actions: [
          Transform.scale(
            scale: 1.5,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.notifications_none,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: const BannerView()),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 7,
                width: MediaQuery.of(context).size.width,
                color: Colors.yellow,
                child: const MemberScreen(),
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width,
                color: Colors.orange,
                child: const Text(
                  'Button',
                  style: TextStyle(
                    fontSize: 36,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width,
                color: Colors.greenAccent,
                child: const Text(
                  'Online',
                  style: TextStyle(
                    fontSize: 36,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.lightBlueAccent,
                child: const Text(
                  '測試底部導覽及滑動',
                  style: TextStyle(
                    fontSize: 36,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首頁',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.speaker),
            label: '活動訊息',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: '發票補登',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '會員中心',
          ),
        ],
        selectedFontSize: 18,
        unselectedFontSize: 18,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[700],
        backgroundColor: Colors.purpleAccent,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
