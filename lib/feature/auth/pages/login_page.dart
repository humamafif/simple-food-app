import 'package:flutter/material.dart';
import '/core/color_constant.dart';
import '/feature/auth/services/auth_services.dart';
import '/pages/widgets/bottom_navbar.dart';

import 'register_page.dart'; // Import RegisterPage

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  String _message = '';

  void _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _message = "Username dan Password tidak boleh kosong";
      });
      return;
    }

    final result = await _authService.login(username, password);

    if (result["success"]) {
      setState(() {
        _message = result["message"];
      });
      // Navigasi ke HomePage setelah login sukses
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => BottomNavbar(
                  username: username,
                )),
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
        title: const Text("Login"),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: ashYellow),
                  onPressed: _login,
                  child: const Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold, color: black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RegisterPage()), // Arahkan ke RegisterPage
                    );
                  },
                  child: const Text('Belum punya akun? Daftar di sini',
                      style: TextStyle(color: Colors.blue)),
                ),
              ],
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
