import 'package:flutter/material.dart';
import '/core/color_constant.dart';
import '/feature/profile/presentation/widget/header_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            HeaderProfile(
              username: username,
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "v1.1.1",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: ashYellow),
              ),
            )
          ],
        ),
      ),
    );
  }
}
