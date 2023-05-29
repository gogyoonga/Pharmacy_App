
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
       home: const PharmacyApp(),
      routes: {
        '/symptom': (context) => const SymptomSearch(),
        '/symptom/cold_diagnose': (context) => const ColdDiagnoseScreen(),
        '/symptom/cold_diagnose/cold_drug': (context) => const ColdDrugScreen(),
        '/symptom/etc': (context) => const EtcScreen(),
        '/symptom/etc/warning': (context) => const Warning(),
        '/symptom/etc/mouth_drug_screen': (context) => const MouthDrugScreen(),
        '/pharmacy_search': (context) => const PharmacySearch(),
        '/pharmacy/pharmacy_search_screen': (context) =>
            const PharmacySearchScreen(),
      },

    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MAIN'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Image(image: AssetImage('images/0.png'),width: 200,),
            SizedBox(
              width: 300,
              child: Image.asset("images/main.png"),
            ),
            SizedBox(

              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/symptom');
                },
                child: const Text('증상검색'),
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              width: 200,
              height: 50,
              child:ElevatedButton(
              onPressed: () {
                  Navigator.pushNamed(context, '/symptom/etc/warning');
              },
              child: const Text('약물검색'),
            ),),
            Container(
              margin: const EdgeInsets.only(bottom: 80),
              width: 200,
              height: 50,
              child:
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/bottom_navigation');
              },
              child: const Text('약국검색'),
            ),),
          ],
        ),
      ),
    );
  }
}
