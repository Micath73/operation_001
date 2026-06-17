import 'dart:ui';

import 'package:flutter/material.dart';

class Glassbox extends StatelessWidget {

final Widget child;

const Glassbox({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(

        child: Stack(
          children: [

            BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaY: 5,
                  sigmaX: 5,
                ),
              child: Container(),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withValues(alpha:0.2)),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(

                  begin: Alignment.topLeft,
                    end: Alignment.bottomRight,

                    colors: [
                      Colors.white.withValues(alpha: 0.5),
                      Colors.white.withValues(alpha: 0.1),
                    ],)
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
