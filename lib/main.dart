import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

import 'screens/screens.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  //CONSTRUCTOR
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {



    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> UIProvider()),
        ChangeNotifierProvider(create: (context)=> ScanListProvider()),
        ChangeNotifierProvider(create: (context)=> DBProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR READER',
        initialRoute: '/home',
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.grey[800],
          scaffoldBackgroundColor: Colors.grey[600],
        ),
        routes:{
          '/home': (context) => HomeScreen(),
          '/map': (context) => MapScreen(),
          '/delete': (context) => DeleteScreen(),
        },
      ),
    );
  }
}