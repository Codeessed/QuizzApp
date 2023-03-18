import 'package:flutter/material.dart';
import 'package:quizz_app/flutter_quizz_screens.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/quizz_result_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'html_quizz_screens.dart';


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
          '/html_first': (context) => HtmlFirstQuiz(),
          '/html_second': (context) => HtmlSecondQuiz(),
          '/html_third': (context) => HtmlThirdQuiz(),
          '/html_fourth': (context) => HtmlFourthQuiz(),
          '/html_fifth': (context) => HtmlFifthQuiz(),
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
  var htmlProgress = 0;
  var flutterScore = 0;
  var htmlCurrentPage = 0;
  var htmlScore = 0;
  var quizOption = 0;

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
  void increaseHtmlPageValue(AnsData htmlAns){
    htmlCurrentPage++;
    htmlProgress = htmlCurrentPage*20;
    htmlAnsList.add(htmlAns);
  }
  void increaseHtmlScoreValue(){
    htmlScore++;
  }
  void resetHtmlPageValue(){
    htmlCurrentPage = 0;
    flutterProgress = flutterCurrentPage*20;
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

  Widget customOutlinedButton(String text, int index, IconData icon, int progress, bool showProgress)   {

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
            Visibility(
              visible: showProgress,
              child: Text(
                '$progress%',
                style: TextStyle(
                  color: (btnIndex == index) ? Colors.green : Colors.black,
                ),
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
            customOutlinedButton("Flutter", 1,  Icons.flutter_dash, appState.flutterProgress, btnIndex == 1),
            const SizedBox(height: 20),
            customOutlinedButton("Html", 2, Icons.html, appState.htmlProgress, btnIndex == 2),
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
                    'Please take your time when answering each question as you are not allowed to go back to previous page to make corrections.',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 15,
                        )
                    )
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
                    appState.quizOption = btnIndex;
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
        showSnackBar(context, 'You already completed Flutter Quizz');
    }
  }

  void chooseHtmlDestination(MyAppState appState){
    switch(appState.htmlCurrentPage){
      case 0:
        Navigator.pushNamed(context, '/html_first');
        break;
      case 1:
        Navigator.pushNamed(context, '/html_second');
        break;
      case 2:
        Navigator.pushNamed(context, '/html_third');
        break;
      case 3:
        Navigator.pushNamed(context, '/html_fourth');
        break;
      case 4:
        Navigator.pushNamed(context, '/html_fifth');
        break;
      default:
        showSnackBar(context, 'You already completed Html Quizz');
    }
  }

  void showSnackBar(BuildContext context, String text){
    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(content: Text(text)));
  }

}

