import 'package:flutter/material.dart';

class UserLibrary extends StatefulWidget {
  const UserLibrary({super.key});

  @override
  State<UserLibrary> createState() => _UserLibraryState();
}

class _UserLibraryState extends State<UserLibrary> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('LIBRARY', style: TextStyle(fontSize: 50.0)),
    );
  }
}
