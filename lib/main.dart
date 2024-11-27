import 'dart:ffi';

import 'package:flutter/material.dart';
import 'constants.dart';
import 'components/theme_button.dart';
import 'components/color_button.dart';
import 'home.dart';

void main() {
  runApp(const Yummy());
}

class Yummy extends StatefulWidget {

   const Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
   ThemeMode themeMode = ThemeMode.light;//manual theme toggle
   ColorSelection colorSelected = ColorSelection.pink;

  void changeThemeMode(bool useLigthtMode){
    setState(() {
      themeMode = useLigthtMode
          ? ThemeMode.light
          : ThemeMode.dark;
    });
  }
  void changeColor(int value){
    setState(() {
      colorSelected = ColorSelection.values[value];
    });
  }
  @override
  Widget build(BuildContext context) {

    const appTitle = 'Yummy';
    //TODO: setUp default theme
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      //TODO: Replace scaffold with home widget
      home: Home(
        changeTheme: changeThemeMode,
        changeColor: changeColor,
        colorSelected: colorSelected,
      ),
    );
  }
}

