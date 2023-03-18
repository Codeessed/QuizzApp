
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/flutter_quizz_screens.dart';
import 'package:quizz_app/main.dart';

class HtmlFirstQuiz extends StatefulWidget{
  const HtmlFirstQuiz({super.key});

  @override
  State<HtmlFirstQuiz> createState() => _HtmlFirstQuizState();
}

class _HtmlFirstQuizState extends State<HtmlFirstQuiz> {

  var firstAnsSelected = 0;
  late bool firstQuizzPicked;
  late AnsData firstHtmlAns;
  final firstAns = 4;

  @override
  void initState() {
    super.initState();
  }

  Widget customRadioButton(int value, int groupValue, String text){
    return RadioListTile(value: value, groupValue: groupValue, onChanged: (value){ setState(() {
      firstAnsSelected = value!;
      firstQuizzPicked = true;
      firstHtmlAns = AnsData(value, text);
    }); print(value == firstAns? true: false); }, title: Text(text), contentPadding: const EdgeInsets.all(0));
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    firstQuizzPicked = firstAnsSelected > 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 1 (Html)'),
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
                      customRadioButton(1, firstAnsSelected, "answer 1"),
                      customRadioButton(2, firstAnsSelected, "answer 2"),
                      customRadioButton(3, firstAnsSelected, "answer 3"),
                      customRadioButton(4, firstAnsSelected, "answer 4")
                    ]
                  ),
                  const Spacer(flex: 4,),
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: firstQuizzPicked? Colors.green : Colors.grey
                      ),
                      onPressed: (){
                        firstQuizzPicked? addToPageAndProceed(appState): showSnackBar(context, 'Choose an answer');
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
    appState.increaseHtmlPageValue(firstHtmlAns);
    if(firstAnsSelected == firstAns){
      appState.increaseHtmlScoreValue();
    }
    Navigator.pushReplacementNamed(context, '/html_second');
  }
  void showSnackBar(BuildContext context, String text){
    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(content: Text(text)));
  }
}

class HtmlSecondQuiz extends StatefulWidget{
  const HtmlSecondQuiz({super.key});

  @override
  State<HtmlSecondQuiz> createState() => _HtmlSecondQuizState();
}

class _HtmlSecondQuizState extends State<HtmlSecondQuiz> {

  var secondAnsSelected = 0;
  late bool secondQuizzPicked;
  late AnsData secondHtmlAns;
  final secondAns = 3;

  @override
  void initState() {
    super.initState();
  }

  Widget customRadioButton(int value, int groupValue, String text){
    return RadioListTile(value: value, groupValue: groupValue, onChanged: (value){ setState(() {
      secondAnsSelected = value!;
      secondQuizzPicked = true;
      secondHtmlAns = AnsData(value, text);
    }); print(value == secondAns? true: false); }, title: Text(text), contentPadding: const EdgeInsets.all(0));
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    secondQuizzPicked = secondAnsSelected > 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 2 (Html)'),
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
    appState.increaseHtmlPageValue(secondHtmlAns);
    if(secondAnsSelected == secondAns){
      appState.increaseHtmlScoreValue();
    }
    Navigator.pushReplacementNamed(context, '/html_third');
  }
  void showSnackBar(BuildContext context, String text){
    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(content: Text(text)));
  }
}

class HtmlThirdQuiz extends StatefulWidget{
  const HtmlThirdQuiz({super.key});

  @override
  State<HtmlThirdQuiz> createState() => _HtmlThirdQuizState();
}

class _HtmlThirdQuizState extends State<HtmlThirdQuiz> {

  var thirdAnsSelected = 0;
  late bool thirdQuizzPicked;
  late AnsData thirdHtmlAns;
  final thirdAns = 2;

  @override
  void initState() {
    super.initState();
  }

  Widget customRadioButton(int value, int groupValue, String text){
    return RadioListTile(value: value, groupValue: groupValue, onChanged: (value){ setState(() {
      thirdAnsSelected = value!;
      thirdQuizzPicked = true;
      thirdHtmlAns = AnsData(value, text);
    }); print(value == thirdAns? true: false); }, title: Text(text), contentPadding: const EdgeInsets.all(0));
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    thirdQuizzPicked = thirdAnsSelected > 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 3 (Html)'),
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
    appState.increaseHtmlPageValue(thirdHtmlAns);
    if(thirdAnsSelected == thirdAns){
      appState.increaseHtmlScoreValue();
    }
    Navigator.pushReplacementNamed(context, '/html_fourth');
  }
  void showSnackBar(BuildContext context, String text){
    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(content: Text(text)));
  }
}

class HtmlFourthQuiz extends StatefulWidget{
  const HtmlFourthQuiz({super.key});

  @override
  State<HtmlFourthQuiz> createState() => _HtmlFourthQuizState();
}

class _HtmlFourthQuizState extends State<HtmlFourthQuiz> {

  var fourthAnsSelected = 0;
  late bool fourthQuizzPicked;
  late AnsData fourthHtmlAns;
  final fourthAns = 1;

  @override
  void initState() {
    super.initState();
  }

  Widget customRadioButton(int value, int groupValue, String text){
    return RadioListTile(value: value, groupValue: groupValue, onChanged: (value){ setState(() {
      fourthAnsSelected = value!;
      fourthQuizzPicked = true;
      fourthHtmlAns = AnsData(value, text);
    }); print(value == fourthAns? true: false); }, title: Text(text), contentPadding: const EdgeInsets.all(0));
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    fourthQuizzPicked = fourthAnsSelected > 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 4 (Html)'),
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
    appState.increaseHtmlPageValue(fourthHtmlAns);
    if(fourthAnsSelected == fourthAns){
      appState.increaseHtmlScoreValue();
    }
    Navigator.pushReplacementNamed(context, '/html_fifth');
  }
  void showSnackBar(BuildContext context, String text){
    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(content: Text(text)));
  }
}

class HtmlFifthQuiz extends StatefulWidget{
  const HtmlFifthQuiz({super.key});

  @override
  State<HtmlFifthQuiz> createState() => _HtmlFifthQuizState();
}

class _HtmlFifthQuizState extends State<HtmlFifthQuiz> {

  var fifthAnsSelected = 0;
  late bool fifthQuizzPicked;
  late AnsData fifthHtmlAns;
  final fifthAns = 3;

  @override
  void initState() {
    super.initState();
  }

  Widget customRadioButton(int value, int groupValue, String text){
    return RadioListTile(value: value, groupValue: groupValue, onChanged: (value){ setState(() {
      fifthAnsSelected = value!;
      fifthQuizzPicked = true;
      fifthHtmlAns = AnsData(value, text);
    }); print(value == fifthAns? true: false); }, title: Text(text), contentPadding: const EdgeInsets.all(0));
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    fifthQuizzPicked = fifthAnsSelected > 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 5 (Html)'),
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
    appState.increaseHtmlPageValue(fifthHtmlAns);
    if(fifthAnsSelected == fifthAns){
      appState.increaseHtmlScoreValue();
    }
    Navigator.pushReplacementNamed(context, '/result_screen');
  }
  void showSnackBar(BuildContext context, String text){
    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(content: Text(text)));
  }
}
