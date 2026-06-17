import 'package:flutter/material.dart';

class chaplet extends StatefulWidget {
  const chaplet({super.key});

  @override
  State<chaplet> createState() => _chapletState();
}

class _chapletState extends State<chaplet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Divine Mercy Chaplet', style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),),
        centerTitle: true,

      ),
    );
  }
}
