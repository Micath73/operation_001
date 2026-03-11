import 'package:flutter/material.dart';

class UserBible extends StatefulWidget {
  const UserBible({super.key});

  @override
  State<UserBible> createState() => _UserBibleState();
}

class _UserBibleState extends State<UserBible> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('MENU', style: TextStyle(fontSize: 50.0)),
    );
  }
}
