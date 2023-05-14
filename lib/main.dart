import 'package:flutter/material.dart';
import 'package:todo_flutter/screen/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
// init the hive
  await Hive.initFlutter();

  //open the box
  var box = await Hive.openBox('hbox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
