import 'package:digitaliza/views/home_page.dart';
import 'package:digitaliza/views/scan_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  GetStorage.init().then((value) {
    runApp(const DigitalizaApp());
  });
}

class DigitalizaApp extends StatelessWidget {
  const DigitalizaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Digitaliza',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/scan': (context) => ScanPage(),
      },
    );
  }
}
