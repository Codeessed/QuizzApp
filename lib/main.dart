import 'package:flutter/material.dart';
import 'package:quizz_app/flutter_quizz_screens.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/quizz_result_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) =>
              MyHomePage(title: 'Programming Quiz'),
          '/flutter_first': (context) => FlutterFirstQuiz(),
          '/flutter_second': (context) => FlutterSecondQuiz(),
          '/flutter_third': (context) => FlutterThirdQuiz(),
          '/flutter_fourth': (context) => FlutterFourthQuiz(),
          '/flutter_fifth': (context) => FlutterFifthQuiz(),
          '/result_screen': (context) => QuizResultScreen()
        },
      ),
    );
  }
}

class MyAppState extends ChangeNotifier{
  List<AnsData> flutterAnsList = [];
  List<AnsData> htmlAnsList = [];
  var flutterCurrentPage = 0;
  var flutterProgress = 0;
  var flutterScore = 0;
  var htmlCurrentPage = 0;
  var htmlScore = 0;

  void increaseFlutterPageValue(AnsData flutterAns){
    flutterCurrentPage++;
    flutterProgress = flutterCurrentPage*20;
    flutterAnsList.add(flutterAns);
  }
  void increaseFlutterScoreValue(){
    flutterScore++;
  }
  void resetFlutterPageValue(){
    flutterCurrentPage = 0;
    flutterProgress = flutterCurrentPage*20;
  }
  void increaseHtmlPageValue(){
    htmlCurrentPage++;
  }
  void increaseHtmlScoreValue(){
    htmlScore++;
  }
  void resetHtmlPageValue(){
    htmlCurrentPage = 0;
  }

}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}


class _MyHomePageState extends State<MyHomePage>{
  int btnIndex = 0;
  // final List<bool> _selections = List.generate(2, (_)=>false );
  late bool buttonEnabled;

  @override
  void initState() {
    super.initState();
    buttonEnabled = false;
  }

  Widget customOutlinedButton(String text, int index, IconData icon, int progress)   {

    return OutlinedButton(
      onPressed: () {
        setState(() {
          btnIndex = index;
        });
      },

      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 2, color: (btnIndex == index) ? Colors.green : Colors.black)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
             Icon(icon,size: 40, color: (btnIndex == index) ? Colors.green : Colors.black),
            const SizedBox(width: 20),
            Text(
              text,
              style: TextStyle(
                color: (btnIndex == index) ? Colors.green : Colors.black,
              ),
            ),
            const Spacer(),
            Text(
              '$progress%',
              style: TextStyle(
                color: (btnIndex == index) ? Colors.green : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    buttonEnabled = btnIndex > 0;

    return  Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                'Pick a course.',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                  fontSize: 18,
                  fontFamily: 'Roboto'
                )
            ),
            const SizedBox(height: 30),
            customOutlinedButton("Flutter", 1,  Icons.flutter_dash, appState.flutterProgress),
            const SizedBox(height: 20),
            customOutlinedButton("Html", 2, Icons.html, 0),
            const SizedBox(height: 50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'N.B:',
                    style: TextStyle(
                    fontWeight: FontWeight.bold
                )),
                const SizedBox(width: 10),
                Expanded(child: Text(
                    'Please take your time when answering each question as you cannot go back to previous page to make corrections.',
                  style: TextStyle(
                    fontWeight: FontWeight.w300
                  ),
                )
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: buttonEnabled? Colors.green : Colors.grey
                  ),
                  onPressed: (){
                    buttonEnabled? choosePath(appState): showSnackBar(context, 'Pick a quizz');
                    setState(() {
                      btnIndex = 0;
                    });
                    // setState(() {
                    //   buttonEnabled = !buttonEnabled;
                    // });
                  },
                  child: const Text("Continue")
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );

  }
  void choosePath(MyAppState appState){
    if(btnIndex == 1){
      chooseFlutterDestination(appState);
    }else{
      chooseHtmlDestination(appState);
    }
  }
  void chooseFlutterDestination(MyAppState appState){
    switch(appState.flutterCurrentPage){
      case 0:
        Navigator.pushNamed(context, '/flutter_first');
        break;
      case 1:
        Navigator.pushNamed(context, '/flutter_second');
        break;
      case 2:
        Navigator.pushNamed(context, '/flutter_third');
        break;
      case 3:
        Navigator.pushNamed(context, '/flutter_fourth');
        break;
      case 4:
        Navigator.pushNamed(context, '/flutter_fifth');
        break;
      default:
        showSnackBar(context, 'You completed Flutter Quizz');
    }
  }

  void chooseHtmlDestination(MyAppState appState){
    switch(appState.htmlCurrentPage){
      case 0:
        showSnackBar(context, 'html 0');
        break;
      case 1:
        showSnackBar(context, 'html 1');
        break;
      default:
        showSnackBar(context, 'html');
    }
  }

  void showSnackBar(BuildContext context, String text){
    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(content: Text(text)));
  }

}

