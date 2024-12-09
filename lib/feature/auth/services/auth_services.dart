import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String apiUrl = "http://localhost:3000/users";
  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http
        .get(Uri.parse('$apiUrl?username=$username&password=$password'));

    if (response.statusCode == 200) {
      final List<dynamic> users = json.decode(response.body);
      if (users.isNotEmpty) {
        return {"success": true, "message": "Login berhasil", "user": users[0]};
      } else {
        return {"success": false, "message": "Username atau password salah"};
      }
    } else {
      return {"success": false, "message": "Gagal terhubung ke server"};
    }
  }

  Future<Map<String, dynamic>> register(
      String username, String password) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"username": username, "password": password}),
    );

    if (response.statusCode == 201) {
      return {"success": true, "message": "Pendaftaran berhasil"};
    } else {
      return {"success": false, "message": "Pendaftaran gagal"};
    }
  }
}
