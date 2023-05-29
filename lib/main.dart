
import 'package:drug_app/home_screen.dart';
import 'package:drug_app/pharmacy_search.dart';
import 'package:drug_app/pharmacy_search_screen.dart';
import 'package:drug_app/search_screen.dart';
import 'package:drug_app/warning.dart';
import 'package:flutter/material.dart';
import 'package:drug_app/mouth_drug_screen.dart';


import 'cold_diagnose_screen.dart';
import 'cold_drug_screen.dart';
import 'etc_screen.dart';
import 'pharmacy_app.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
       home: const HomeScreen(),
      routes: {

        '/symptom': (context) => const SymptomSearch(),
        '/symptom/cold_diagnose': (context) => const ColdDiagnoseScreen(),
        '/symptom/cold_diagnose/cold_drug': (context) => const ColdDrugScreen(),
        '/symptom/etc': (context) => const EtcScreen(),
        '/symptom/etc/warning': (context) => const Warning(),
        '/symptom/etc/mouth_drug_screen': (context) => const MouthDrugScreen(),
        '/pharmacy_search': (context) => const PharmacySearch(),
        '/pharmacy/pharmacy_search_screen': (context) =>
            const PharmacySearchScreen()
            ,
            '/home_screen':(context)=> const HomeScreen(),
            '/bottom_navigation': (context) => const PharmacyApp(),

      },

    );
  }
}
