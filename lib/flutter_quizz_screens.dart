
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/main.dart';

class FlutterFirstQuiz extends StatefulWidget{
  const FlutterFirstQuiz({super.key});

  @override
  State<FlutterFirstQuiz> createState() => _FlutterFirstQuizState();
}

class _FlutterFirstQuizState extends State<FlutterFirstQuiz> {
  var radioNoSelected = 0;
  late bool btnIsEnabled;
  late AnsData firsFlutterAns;
  final ans = 1;

  @override
  void initState() {
    super.initState();
  }

  Widget customRadioButton(int value, int groupValue, String text){
    return RadioListTile(value: value, groupValue: groupValue, onChanged: (value){ setState(() {
      radioNoSelected = value!;
      btnIsEnabled = true;
      firsFlutterAns = AnsData(value, text);
    }); print(value == ans? true: false); }, title: Text(text), contentPadding: const EdgeInsets.all(0));
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
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
                        btnIsEnabled? addToPageAndProceed(appState): showSnackBar(context, 'Choose an answer');
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
  void addToPageAndProceed(MyAppState appState){
    appState.increaseFlutterPageValue(firsFlutterAns);
    if(radioNoSelected == ans){
      appState.increaseFlutterScoreValue();
    }
    Navigator.pushReplacementNamed(context, '/flutter_second');
  }
  void showSnackBar(BuildContext context, String text){
    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(content: Text(text)));
  }
}

class FlutterSecondQuiz extends StatefulWidget{
  const FlutterSecondQuiz({super.key});

  @override
  State<FlutterSecondQuiz> createState() => _FlutterSecondQuizState();
}

class _FlutterSecondQuizState extends State<FlutterSecondQuiz> {
  var secondAnsSelected = 0;
  late bool secondQuizzPicked;
  late AnsData secondFlutterAns;
  final secondAns = 2;

  @override
  void initState() {
    super.initState();
  }

  Widget customRadioButton(int value, int groupValue, String text){
    return RadioListTile(value: value, groupValue: groupValue, onChanged: (value){ setState(() {
      secondAnsSelected = value!;
      secondQuizzPicked = true;
      secondFlutterAns = AnsData(value, text);
    }); print(value == secondAns? true: false); }, title: Text(text), contentPadding: const EdgeInsets.all(0));
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    secondQuizzPicked = secondAnsSelected > 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 2 (Flutter)'),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('2.'),
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
                        customRadioButton(1, secondAnsSelected, "answer 1"),
                        customRadioButton(2, secondAnsSelected, "answer 2"),
                        customRadioButton(3, secondAnsSelected, "answer 3"),
                        customRadioButton(4, secondAnsSelected, "answer 4")
                      ]
                  ),
                  const Spacer(flex: 4,),
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: secondQuizzPicked? Colors.green : Colors.grey
                      ),
                      onPressed: (){
                        secondQuizzPicked? addToPageAndProceed(appState): showSnackBar(context, 'Choose an answer');
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
  void addToPageAndProceed(MyAppState appState){
    appState.increaseFlutterPageValue(secondFlutterAns);
    if(secondAnsSelected == secondAns){
      appState.increaseFlutterScoreValue();
    }
    Navigator.pushReplacementNamed(context, '/flutter_third');

  }
  void showSnackBar(BuildContext context, String text){
    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(content: Text(text)));
  }
}

class FlutterThirdQuiz extends StatefulWidget{
  const FlutterThirdQuiz({super.key});

  @override
  State<FlutterThirdQuiz> createState() => _FlutterThirdQuizState();
}

class _FlutterThirdQuizState extends State<FlutterThirdQuiz> {
  var thirdAnsSelected = 0;
  late bool thirdQuizzPicked;
  late AnsData thirdFlutterAns;
  final thirdAns = 3;

  @override
  void initState() {
    super.initState();
  }

  Widget customRadioButton(int value, int groupValue, String text){
    return RadioListTile(value: value, groupValue: groupValue, onChanged: (value){ setState(() {
      thirdAnsSelected = value!;
      thirdQuizzPicked = true;
      thirdFlutterAns = AnsData(value, text);
    }); print(value == thirdAns? true: false); }, title: Text(text), contentPadding: const EdgeInsets.all(0));
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    thirdQuizzPicked = thirdAnsSelected > 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 3 (Flutter)'),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('3.'),
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
                        customRadioButton(1, thirdAnsSelected, "answer 1"),
                        customRadioButton(2, thirdAnsSelected, "answer 2"),
                        customRadioButton(3, thirdAnsSelected, "answer 3"),
                        customRadioButton(4, thirdAnsSelected, "answer 4")
                      ]
                  ),
                  const Spacer(flex: 4,),
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: thirdQuizzPicked? Colors.green : Colors.grey
                      ),
                      onPressed: (){
                        thirdQuizzPicked? addToPageAndProceed(appState): showSnackBar(context, 'Choose an answer');
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
  void addToPageAndProceed(MyAppState appState){
    appState.increaseFlutterPageValue(thirdFlutterAns);
    if(thirdAnsSelected == thirdAns){
      appState.increaseFlutterScoreValue();
    }
    Navigator.pushReplacementNamed(context, '/flutter_fourth');

  }
  void showSnackBar(BuildContext context, String text){
    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(content: Text(text)));
  }
}


class FlutterFourthQuiz extends StatefulWidget{
  const FlutterFourthQuiz({super.key});

  @override
  State<FlutterFourthQuiz> createState() => _FlutterFourthQuizState();
}

class _FlutterFourthQuizState extends State<FlutterFourthQuiz> {
  var fourthAnsSelected = 0;
  late bool fourthQuizzPicked;
  late AnsData fourthFlutterAns;
  final fourthAns = 4;

  @override
  void initState() {
    super.initState();
  }

  Widget customRadioButton(int value, int groupValue, String text){
    return RadioListTile(value: value, groupValue: groupValue, onChanged: (value){ setState(() {
      fourthAnsSelected = value!;
      fourthQuizzPicked = true;
      fourthFlutterAns = AnsData(value, text);
    }); print(value == fourthAns? true: false); }, title: Text(text), contentPadding: const EdgeInsets.all(0));
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    fourthQuizzPicked = fourthAnsSelected > 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 4 (Flutter)'),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('4.'),
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
                        customRadioButton(1, fourthAnsSelected, "answer 1"),
                        customRadioButton(2, fourthAnsSelected, "answer 2"),
                        customRadioButton(3, fourthAnsSelected, "answer 3"),
                        customRadioButton(4, fourthAnsSelected, "answer 4")
                      ]
                  ),
                  const Spacer(flex: 4,),
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: fourthQuizzPicked? Colors.green : Colors.grey
                      ),
                      onPressed: (){
                        fourthQuizzPicked? addToPageAndProceed(appState): showSnackBar(context, 'Choose an answer');
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
  void addToPageAndProceed(MyAppState appState){
    appState.increaseFlutterPageValue(fourthFlutterAns);
    if(fourthAnsSelected == fourthAns){
      appState.increaseFlutterScoreValue();
    }
    Navigator.pushReplacementNamed(context, '/flutter_fifth');
  }
  void showSnackBar(BuildContext context, String text){
    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(content: Text(text)));
  }
}


class FlutterFifthQuiz extends StatefulWidget{
  const FlutterFifthQuiz({super.key});

  @override
  State<FlutterFifthQuiz> createState() => _FlutterFifthQuizState();
}

class _FlutterFifthQuizState extends State<FlutterFifthQuiz> {
  var fifthAnsSelected = 0;
  late bool fifthQuizzPicked;
  late AnsData fifthFlutterAns;
  final fifthAns = 2;

  @override
  void initState() {
    super.initState();
  }

  Widget customRadioButton(int value, int groupValue, String text){
    return RadioListTile(value: value, groupValue: groupValue, onChanged: (value){ setState(() {
      fifthAnsSelected = value!;
      fifthQuizzPicked = true;
      fifthFlutterAns = AnsData(value, text);
    }); print(value == fifthAns? true: false); }, title: Text(text), contentPadding: const EdgeInsets.all(0));
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    fifthQuizzPicked = fifthAnsSelected > 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 5 (Flutter)'),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('5.'),
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
                        customRadioButton(1, fifthAnsSelected, "answer 1"),
                        customRadioButton(2, fifthAnsSelected, "answer 2"),
                        customRadioButton(3, fifthAnsSelected, "answer 3"),
                        customRadioButton(4, fifthAnsSelected, "answer 4")
                      ]
                  ),
                  const Spacer(flex: 4,),
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: fifthQuizzPicked? Colors.green : Colors.grey
                      ),
                      onPressed: (){
                        fifthQuizzPicked? addToPageAndProceed(appState): showSnackBar(context, 'Choose an answer');
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

  void addToPageAndProceed(MyAppState appState){
    appState.increaseFlutterPageValue(fifthFlutterAns);
    if(fifthAnsSelected == fifthAns){
      appState.increaseFlutterScoreValue();
    }
    Navigator.pushReplacementNamed(context, '/result_screen');
  }
  void showSnackBar(BuildContext context, String text){
    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(content: Text(text)));
  }
}

class AnsData{
  final int value;
  final String title;
  AnsData(this.value, this.title);
}


