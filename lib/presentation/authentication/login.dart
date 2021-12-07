import 'package:covid_report/presentation/presentations.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 200),
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
              child: const Text('LOGIN AS DOCTOR'),
              onPressed: () {
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(builder: (context) => const DoctorPage()),
                //   (Route<dynamic> route) => false,
                // );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DoctorPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('LOGIN AS PATIENT'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PatientPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
