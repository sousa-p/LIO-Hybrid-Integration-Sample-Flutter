import 'package:flutter/material.dart';
import 'package:flutter_lio_integration/routing/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SDK Integration',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
    );
  }
}
