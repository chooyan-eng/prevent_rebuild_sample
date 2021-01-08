import 'package:flutter/material.dart';
import 'package:stop_rebuild_example/use_cache_page.dart';
import 'package:stop_rebuild_example/use_const_page.dart';
import 'package:stop_rebuild_example/use_injection_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: UseConstPage(),
      // home: UseCachePage(),
      home: UseInjectionPage(),
    );
  }
}
