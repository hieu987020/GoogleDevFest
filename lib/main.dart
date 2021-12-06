import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Username',
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Password',
            ),
            obscureText: true,
          ),
          ElevatedButton(
            child: const Text('LOGIN'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
