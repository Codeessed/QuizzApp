
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterFirstQuiz extends StatefulWidget{
  const FlutterFirstQuiz({super.key});

  @override
  State<FlutterFirstQuiz> createState() => _FlutterFirstQuizState();
}

class _FlutterFirstQuizState extends State<FlutterFirstQuiz> {
  var radioNoSelected = 0;
  late bool btnIsEnabled;
  final ans = 2;

  @override
  void initState() {
    super.initState();
  }

  Widget customRadioButton(int value, int groupValue, String text){
    return RadioListTile(value: value, groupValue: groupValue, onChanged: (value){ setState(() {
      radioNoSelected = value!;
      btnIsEnabled = true;
    }); print(value == ans? true: false); }, title: Text(text), contentPadding: const EdgeInsets.all(0));
  }

  @override
  Widget build(BuildContext context) {
    btnIsEnabled = radioNoSelected > 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 1 (Flutter)'),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('1.'),
            const SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('What are the components for flutter which are usually found in the heart of a lion tiger fox girrafe oxen and all others'),
                  const SizedBox(height: 40),
                  const Text('Options'),
                  const Divider(),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      customRadioButton(1, radioNoSelected, "answer 1"),
                      customRadioButton(2, radioNoSelected, "answer 2"),
                      customRadioButton(3, radioNoSelected, "answer 3"),
                      customRadioButton(4, radioNoSelected, "answer 4")
                    ]
                  ),
                  const Spacer(flex: 4,),
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: btnIsEnabled? Colors.green : Colors.grey
                      ),
                      onPressed: (){
                        btnIsEnabled? showSnackBar(context, 'Move to next screen'): showSnackBar(context, 'Choose an answer');
                      },
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Next'),
                    ),
                  ),
                  const Spacer(flex: 1,),

                ],

              ),
            )
          ],
        ),
      ),
    );
  }
  void showSnackBar(BuildContext context, String text){
    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(content: Text(text)));
  }
}