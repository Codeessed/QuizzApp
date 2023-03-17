
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/flutter_quizz_screens.dart';
import 'package:quizz_app/main.dart';

class QuizResultScreen extends StatelessWidget{
  final correctAns = [AnsData(1, 'Answer 1'), AnsData(2, 'Answer 2'), AnsData(3, 'Answer 3'), AnsData(4, 'Answer 4'), AnsData(2, 'Answer 2')];
  late List<AnsData> yourAnsList;
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    yourAnsList = appState.flutterAnsList;

    return Scaffold(
      appBar: AppBar(title: Text('Result'),),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text('Your Answers'),
                          SizedBox(height: 20,),
                          answersWidget(1, yourAnsList[0].title, chooseIcon(0), chooseColor(0), true),
                          answersWidget(2, yourAnsList[1].title, chooseIcon(1), chooseColor(1), true),
                          answersWidget(3, yourAnsList[2].title, chooseIcon(2), chooseColor(2), true),
                          answersWidget(4, yourAnsList[3].title, chooseIcon(3), chooseColor(3), true),
                          answersWidget(5, yourAnsList[4].title, chooseIcon(4), chooseColor(4), true),
                        ],
                      ),
                    ),
                    VerticalDivider(thickness: 1),
                    Expanded(
                      child: Column(
                        children: [
                          Text('Correct Answers'),
                          SizedBox(height: 20,),
                          answersWidget(1, correctAns[0].title, Icons.close, Colors.red, false),
                          answersWidget(2, correctAns[1].title, Icons.close, Colors.red, false),
                          answersWidget(3, correctAns[2].title, Icons.close, Colors.red, false),
                          answersWidget(4, correctAns[3].title, Icons.close, Colors.red, false),
                          answersWidget(5, correctAns[4].title, Icons.close, Colors.red, false),
                        ],
                      )
                    )
                  ],
                ),
              ),
              Spacer(flex: 1,),
              Text('Final Score :'),
              Text('${appState.flutterScore} out of 5'),
              SizedBox(height: 30,),
              ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.logout),
                  label: Text("Exit")
              ),
              Spacer(flex: 3),
            ],
          )
      ),
    );
  }
  

  Widget answersWidget(int number, String answer, IconData icon, Color iconColor, bool visible){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          children:[
            Text('$number.'),
            Spacer(flex: 1,),
            Text(answer),
            Spacer(flex: 1),
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: visible,
                child: Icon(icon, color: iconColor)
            ),
            Spacer(flex: 3,),
          ]
      ),
    );
  }
  
  IconData chooseIcon(int index){
    return (yourAnsList[index].value == correctAns[index].value) ? Icons.done: Icons.close;
  }

  Color chooseColor(int index){
    return (yourAnsList[index].value == correctAns[index].value) ? Colors.green: Colors.red;
  }
  

}