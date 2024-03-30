import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: const CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage('assets/images/user2.jpg'),
        ));
  }
}
