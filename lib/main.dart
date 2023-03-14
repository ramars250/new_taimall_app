import 'package:flutter/material.dart';
import 'package:new_taimall_app/pages/login_screen.dart';
import 'package:new_taimall_app/pages/member_screen.dart';
import 'package:new_taimall_app/service/api.dart';
import 'package:new_taimall_app/view_model/banner_view.dart';
import 'package:new_taimall_app/view_model/logout_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const MyApp(),
    ),
  );
}

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

final memGuidProvider = StateProvider((ref) => '');

loadMemFromPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString('MemberGuid') != null) {
    Api.memberGuid = prefs.getString('MemberGuid') ?? "";
  }
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
    loadMemFromPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          Transform.scale(
            scale: 1.5,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
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
            children: <Widget>[
              // Consumer(builder: (context, ref, child) {
              //   final data = ref.watch(memGuidProvider);
              //   return Text(data);
              // }),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: const BannerView()),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 6,
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                color: Colors.lightBlueAccent,
                child: const Text('放圖片的位置'),
              ),
            ),
            Container(
              color: Colors.purpleAccent,
              child: ListTile(
                  title: const Text('登出'),
                  onTap: () {
                    logout();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyApp(),
                      ),
                    );
                  }),
            ),
          ],
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
