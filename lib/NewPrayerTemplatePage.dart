import 'package:flutter/material.dart';
import 'package:operation_001/prayer_data.dart';
import 'package:operation_001/prayer_model.dart';
class Newprayertemplatepage extends StatefulWidget {

  final String prayerTitle;
  final String prayerImage;

  Newprayertemplatepage({
    required this.prayerTitle, required this.prayerImage,
});

  @override
  State<Newprayertemplatepage> createState() => _NewprayertemplatepageState();
}

class _NewprayertemplatepageState extends State<Newprayertemplatepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.prayerTitle),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Image.asset(
            widget.prayerImage,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,)
        ],
      ),

    );
  }
}
