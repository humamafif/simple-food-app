import 'package:flutter/material.dart';
import '/core/color_constant.dart';
import '/feature/auth/services/auth_services.dart';

import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  String _message = '';

  void _register() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _message = "Username dan Password tidak boleh kosong";
      });
      return;
    }

    final result = await _authService.register(username, password);

    if (result["success"]) {
      setState(() {
        _message = result["message"];
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } else {
      setState(() {
        _message = result["message"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text("Register"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: ashYellow,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  hintText: 'Username',
                  hintStyle: TextStyle(color: black),
                  border: InputBorder.none,
                ),
                style: const TextStyle(color: black, fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: ashYellow,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: black),
                  border: InputBorder.none,
                ),
                style: const TextStyle(color: black, fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: ashYellow),
              onPressed: _register,
              child: const Text(
                'Register',
                style: TextStyle(fontWeight: FontWeight.bold, color: black),
              ),
            ),
            if (_message.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  _message,
                  style: TextStyle(
                      color: _message.contains('berhasil')
                          ? Colors.green
                          : Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
