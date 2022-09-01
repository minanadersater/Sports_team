import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {

  late String team1,team2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('team1;${team1}'),
            Text('team2;${team2}'),
          ],
        ),
      ),
    );
  }
}
