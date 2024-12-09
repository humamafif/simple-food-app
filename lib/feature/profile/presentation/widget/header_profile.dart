import 'package:flutter/material.dart';
import '/core/color_constant.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    super.key,
    required this.username,
  });
  final String username;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 80,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 73,
            backgroundImage: AssetImage("assets/profile/person.jpg"),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          username,
          style: const TextStyle(
            color: black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
