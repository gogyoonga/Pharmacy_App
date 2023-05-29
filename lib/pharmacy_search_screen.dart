import 'package:flutter/material.dart';


class PharmacySearchScreen extends StatefulWidget {
  const PharmacySearchScreen({Key? key}) : super(key: key);
  @override
  _PharmacySearchScreenState createState() => _PharmacySearchScreenState();
}

class _PharmacySearchScreenState extends State<PharmacySearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){ },),],
      title: const Text('약국 검색'),
      ),
      body:
      SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Container(margin: const EdgeInsets.only(top: 50)),
            TextField(
            controller: _textEditingController,
              style: const TextStyle(fontSize: 15.0),
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 2, color: Colors.green)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 2, color: Colors.green)
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                hintText: "내용을 입력하세요",
              ),
              textInputAction: TextInputAction.search,
            ),
            ElevatedButton(onPressed: () {
              String symptom = _textEditingController.text.trim();
              if(symptom=="귀가 먹먹해요"){
                Navigator.pushNamed(context, '/symptom/etc/warning');
              }else if(symptom=="입안이 헐었어요"){
                Navigator.pushNamed(context, '/symptom/etc/mouth_drug_screen');
              }
            }, child: const Text('검색')),
            Container(
              margin: const EdgeInsets.only(top: 50, left: 50, right: 50), width: 300,
              child: Image.asset('images/etc.png'),
            ),
          ],)
      ),
    );
  }

  }