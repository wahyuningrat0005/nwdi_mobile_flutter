import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      child: Container(
        width: 200,
        height: 225,
        color: Colors.red,
      ),
    );
  }
}
