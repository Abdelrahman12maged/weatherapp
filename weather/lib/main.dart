import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider/weatherprovider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return weatherprov();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Provider.of<weatherprov>(context).weatherdata == null
            ? Colors.blue
            : Provider.of<weatherprov>(context).weatherdata!.getThemeColor(),
      ),
      home: HomePage(),
    );
  }
}
