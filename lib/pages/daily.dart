import 'package:flutter/material.dart';

class UserDaily extends StatefulWidget {
  const UserDaily({super.key});

  @override
  State<UserDaily> createState() => _UserDailyState();
}

class _UserDailyState extends State<UserDaily> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('DAILY', style: TextStyle(fontSize: 50.0)),
    );
  }
}
