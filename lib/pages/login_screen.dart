import 'package:flutter/material.dart';
import 'package:new_taimall_app/view_model/login_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    passController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
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
              controller: passController,
              decoration: const InputDecoration(
                labelText: "密碼",
                hintText: "請輸入密碼",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // print(nameController.text);
              getLoginData(nameController.text, passController.text);
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
}
