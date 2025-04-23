import 'package:flutter/material.dart';
import 'package:novosistemaflu/common/themes/themes.dart';
import 'package:novosistemaflu/ui/pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Student ID Card',
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
    theme: myTheme,
  ));
}
