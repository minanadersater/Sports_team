import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  TextEditingController _team1 = new TextEditingController();
  TextEditingController _team2 = new TextEditingController();
 // TextEditingController name_team1 = new TextEditingController();
  TextEditingController yourControllerName = new TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sports Team 🥰🤾🏼‍♂️',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: AttendanceScreen(),
    );
  }
}

class AttendanceScreen extends StatefulWidget {
  AttendanceScreen();

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  static var countdownDuration = Duration(minutes: 10);
//  static var countdownDuration1 = Duration(minutes: 10);
  Duration duration = Duration();
  Duration duration1 = Duration();
  Timer? timer;
  Timer? timer1;
  bool countDown = true;
  bool countDown1 = true;
  int teamAPoints = 0;

  int teamBPoints = 0;

  @override
  void initState() {
    var hours;
    var mints;
    var secs;
    hours = int.parse("00");
    mints = int.parse("00");
    secs = int.parse("00");
    countdownDuration = Duration(hours: hours, minutes: mints, seconds: secs);
    startTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Sports Team 🥰🤾🏼‍♂️"),

        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Timer",
                    style: TextStyle(fontSize: 22),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: buildTime()),
                  SizedBox(
                    height: 0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 500,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text (
                                  'Team E',
                                  style: TextStyle(
                                    fontSize: 32,
                                  ),
                                ),
                                Text(
                                  '$teamAPoints',
                                  style: TextStyle(
                                    fontSize: 150,
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(8),
                                    primary: Colors.green,
                                    minimumSize: Size(150, 50),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      teamAPoints++;
                                    });
                                    print(teamAPoints);
                                  },
                                  child: Text(
                                    '👏🏼😍عاااااااااااااااااااش',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    minimumSize: Size(150, 50),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      teamAPoints -= 1;
                                    });
                                  },
                                  child: Text(
                                    '😁نقص واحد يا معلم',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Container(
                            height: 500,
                            child: VerticalDivider(
                              indent: 50,
                              endIndent: 50,
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ),
                          Container(
                            height: 500,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Team B',
                                  style: TextStyle(
                                    fontSize: 32,
                                  ),
                                ),
                                Text(
                                  '$teamBPoints',
                                  style: TextStyle(
                                    fontSize: 150,
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(8),
                                    primary: Colors.green,
                                    minimumSize: Size(150, 50),
                                  ),
                                  onPressed: () {
                                    setState(() {});
                                    teamBPoints++;
                                  },
                                  child: Text(
                                    '👏🏼😍عاااااااااااااااااااش ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    minimumSize: Size(150, 50),
                                  ),
                                  onPressed: () {
                                    setState(() {});
                                    teamBPoints -= 1;
                                  },
                                  child: Text(
                                    '😁نقص واحد يا معلم',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(8),
                          primary: Colors.green,
                          minimumSize: Size(150, 50),
                        ),
                        onPressed: () {
                          setState(() {
                            teamAPoints = 0;
                            teamBPoints = 0;
                            reset();
                          });
                        },
                        child: Text(
                          '😁 من جديد',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),

      ),
      ) );
  }

  Future<bool> _onWillPop() async {
    final isRunning = timer == null ? false : timer!.isActive;
    if (isRunning) {
      timer!.cancel();
    }
    Navigator.of(context, rootNavigator: true).pop(context);
    return true;
  }

  void reset() {
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }



  void addTime() {
    final addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }



  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(time: hours, header: 'HOURS'),
      SizedBox(
        width: 8,
      ),
      buildTimeCard(time: minutes, header: 'MINUTES'),
      SizedBox(
        width: 8,
      ),
      buildTimeCard(time: seconds, header: 'SECONDS'),
    ]);
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(20)),
            child: Text(
              time,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 50),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(header, style: TextStyle(color: Colors.black45)),
        ],
      );
}
