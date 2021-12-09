// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Napp',
        debugShowCheckedModeBanner: false,
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
          primarySwatch: Colors.grey,
        ),
        home: const MyHomePage(title: 'Napp'),
        initialRoute: '/',
        routes: {
          ResultScreen.routeName: (ctx) => ResultScreen(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _gettingupSliderValue = 1.0;
  var _conditionsSliderValue = 1.0;
  var _radioResultExercise;
  var _radioResultNap;
  var _radioResultShower;
  var _radioResultPills;
  String activityDropDownValue = 'Reading';
  final goToSleepController = TextEditingController();
  final wakeUpController = TextEditingController();
  final dinnerController = TextEditingController();
  final outsideController = TextEditingController();
  final sleepBeforeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Center(
                    child: Text(
                      'How sleep deprived are you?',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TextField(
                        controller: goToSleepController,
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          labelText: 'What time did you go to sleep?',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TextField(
                        controller: wakeUpController,
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          labelText: 'What time did you wake up?',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'On scale 1-10 how difficult was it to get up this morning?',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: Slider(
                    value: _gettingupSliderValue,
                    min: 1,
                    max: 10,
                    divisions: 10,
                    label: (_gettingupSliderValue).round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _gettingupSliderValue = value;
                      });
                    },
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Did you exercise today?',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RadioListTile(
                    title: Text(
                      'Yes in the evening',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'Yes evening1',
                    groupValue: _radioResultExercise,
                    onChanged: (value) {
                      setState(() {
                        _radioResultExercise = value;
                      });
                    }),
                RadioListTile(
                    title: Text(
                      'Yes',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'Yes1',
                    groupValue: _radioResultExercise,
                    onChanged: (value) {
                      setState(() {
                        _radioResultExercise = value;
                      });
                    }),
                RadioListTile(
                    title: Text(
                      'No',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'No1',
                    groupValue: _radioResultExercise,
                    onChanged: (value) {
                      setState(() {
                        _radioResultExercise = value;
                      });
                    }),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TextField(
                        controller: dinnerController,
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          labelText: 'What time did you eat dinner?',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Did you have a nap today?',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RadioListTile(
                    title: Text(
                      'Yes after 3pm',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'Yes after2',
                    groupValue: _radioResultNap,
                    onChanged: (value) {
                      setState(() {
                        _radioResultNap = value;
                      });
                    }),
                RadioListTile(
                    title: Text(
                      'Yes before 3pm',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'Yes before2',
                    groupValue: _radioResultNap,
                    onChanged: (value) {
                      setState(() {
                        _radioResultNap = value;
                      });
                    }),
                RadioListTile(
                    title: Text(
                      'No',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'No2',
                    groupValue: _radioResultNap,
                    onChanged: (value) {
                      setState(() {
                        _radioResultNap = value;
                      });
                    }),
                Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'What did you do before going to bed?',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: DropdownButton<String>(
                        value: activityDropDownValue,
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            activityDropDownValue = newValue!;
                          });
                        },
                        items: <String>[
                          'Reading',
                          'Watching TV',
                          'Working on a computer',
                          'Talking',
                          'Listening to music',
                          'Doing homework',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Did you take a shower/bath before bed?',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RadioListTile(
                    title: Text(
                      'Yes',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'Yes3',
                    groupValue: _radioResultShower,
                    onChanged: (value) {
                      setState(() {
                        _radioResultShower = value;
                      });
                    }),
                RadioListTile(
                    title: Text(
                      'No',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'No3',
                    groupValue: _radioResultShower,
                    onChanged: (value) {
                      setState(() {
                        _radioResultShower = value;
                      });
                    }),
                Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'On scale 1-10 how would you rate the conditions in your bedroom?',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: Slider(
                    value: _conditionsSliderValue,
                    min: 1,
                    max: 10,
                    divisions: 10,
                    label: (_conditionsSliderValue).round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _conditionsSliderValue = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TextField(
                        controller: outsideController,
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          labelText: 'How much time did you spend outside?',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Do you take any sleeping medications?',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RadioListTile(
                    title: Text(
                      'Yes',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'Yes4',
                    groupValue: _radioResultPills,
                    onChanged: (value) {
                      setState(() {
                        _radioResultPills = value;
                      });
                    }),
                RadioListTile(
                    title: Text(
                      'No',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'No4',
                    groupValue: _radioResultPills,
                    onChanged: (value) {
                      setState(() {
                        _radioResultPills = value;
                      });
                    }),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TextField(
                        controller: sleepBeforeController,
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          labelText:
                              'How many hours did you sleep the night before?',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: thankunext,
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  void thankunext() {
    var allDaData = [
      goToSleepController.text,
      sleepBeforeController.text,
      _gettingupSliderValue.round(),
      _radioResultExercise,
      dinnerController.text,
      _radioResultNap,
      activityDropDownValue,
      _radioResultShower,
      _conditionsSliderValue.round(),
      outsideController.text,
      _radioResultPills,
      sleepBeforeController.text,
    ];
    Navigator.of(context)
        .pushNamed(ResultScreen.routeName, arguments: allDaData);
  }
}
