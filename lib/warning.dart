import 'package:flutter/material.dart';
class Warning extends StatefulWidget {
  const Warning({Key? key}) : super(key: key);

  @override
  _WarningState createState() => _WarningState();

}
class _WarningState extends State<Warning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('약물 추천'),
      ),
      body: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column( children: [Container(
        margin: const EdgeInsets.only(top: 80), width: 400,
          child: Image.asset('images/warning.png'),
        ),
        Container(
          child: const Text(''),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          child: const Text('main'),
        ),
      ]
      )

    ));



  }
}