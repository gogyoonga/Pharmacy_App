
import 'package:flutter/material.dart';

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
