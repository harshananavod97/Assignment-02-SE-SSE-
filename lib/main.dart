import 'package:flutter/material.dart';

import 'package:harshna_project/provider/menu_provider.dart';


import 'package:harshna_project/screens/Home%20Screen/home_page.dart';

import 'package:harshna_project/screens/Menu%20Screen/menu_Screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => MenuProvider()..loadMenuDataFromAssets()),
      ],
      child: MaterialApp(
          title: 'Hrashana Navod',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: HomePage()),
    );
  }
}
