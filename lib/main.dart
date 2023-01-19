import 'package:flutter/material.dart';
import 'package:nwdi/module/home/view/home_view.dart';

import 'package:nwdi/shared/widgets/bottom/bottom_widget.dart';
import 'package:nwdi/shared/widgets/card_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NWDI',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const BottomWidget(),
    );
  }
}
