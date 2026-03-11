import 'package:flutter/material.dart';

class UserMore extends StatefulWidget {
  const UserMore({super.key});

  @override
  State<UserMore> createState() => _UserMoreState();
}

class _UserMoreState extends State<UserMore> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('MORE', style: TextStyle(fontSize: 50.0)),
    );
  }
}
