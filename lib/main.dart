import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const Scaffold(body: MyHomePage(title: 'Quizz Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}


class _MyHomePageState extends State<MyHomePage> {
  int btnIndex = 0;
  // final List<bool> _selections = List.generate(2, (_)=>false );
  late bool buttonEnabled;

  @override
  void initState() {
    super.initState();
    buttonEnabled = false;
  }

  Widget customRadioButton(String text, int index, IconData icon) {
    buttonEnabled = btnIndex > 0;

    return OutlinedButton(
      onPressed: () {
        setState(() {
          btnIndex = index;
        });
      },

      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 2, color: (btnIndex == index) ? Colors.green : Colors.black)
      ),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      // borderSide: BorderSide(color: (value == index) ? Colors.green : Colors.black),
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
              '0%',
              style: TextStyle(
                color: (btnIndex == index) ? Colors.green : Colors.black,
                // colo: btnIndex == index? Colors.green : Colors.black;
              ),
            ),
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            customRadioButton("Flutter", 1,  Icons.flutter_dash),
            const SizedBox(height: 20),
            customRadioButton("Html", 2, Icons.html),
            const SizedBox(height: 50),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: buttonEnabled? Colors.green : Colors.grey
                ),
                onPressed: (){
                  setState(() {
                    btnIndex = 0;
                  });
                  buttonEnabled? showSnackBar(context, 'Move to next page'): showSnackBar(context, 'Pick a quizz');
                  // setState(() {
                  //   buttonEnabled = !buttonEnabled;
                  // });
                },
                child: const Text("Continue")
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

