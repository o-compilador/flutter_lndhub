import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LndHub',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
          primaryColorDark: Colors.blueGrey.shade700,
          backgroundColor: Colors.blueGrey.shade100,
          cardColor: Colors.yellow,
          errorColor: Colors.orange,
        ),
        textTheme: Typography.englishLike2018,
      ).copyWith(
        splashFactory: InkRipple.splashFactory,
      ),
      home: const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Text('Hello!'),
        ),
      ),
    );
  }
}
