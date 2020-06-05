// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
  	  home: RandomTeams()
    );
  }
}

class RandomTeamsState extends State<RandomTeams> {
  List<String> clubs = ['BVB', 'PSG', 'JUVE', 'REAL', 'BARCA', 'MANU', 'BAYERN'];
  List<String> players = ['Tomek', 'Maciek', 'Antek', 'Jacek', 'Grześ'];
  List<String> clubsShuffeled = ['BVB', 'PSG', 'JUVE', 'REAL', 'BARCA', 'MANU', 'BAYERN'];

  final _biggerFont = const TextStyle(fontSize: 18.0);
  final TextEditingController clubInputCtrl = new TextEditingController();

  void shuffleClubs(clubs, clubsNum) {
    clubsShuffeled = (clubs.toList()..shuffle()).take(clubsNum).toList();
  }

  @override
  Widget build(BuildContext context) {    
      return Scaffold(
        appBar: AppBar(
          title: Text('Random teams'),
        ),
        body: Column(
          children: [
            _clubsInput(),
            _buildPairs(),
          ]
        ),
      );
  }

  Widget _clubsInput() {
    return TextField(
      controller: clubInputCtrl,
      onSubmitted: (text) {
        clubs.add(text);  // Append Text to the list
        shuffleClubs(clubs, players.length);
        clubInputCtrl.clear();     // Clear the Text area
        setState(() {});   // Redraw the Stateful Widget
      }
    );
  }

  Widget _buildPairs() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: players.length * 2,
        // https://stackoverflow.com/questions/50252569/vertical-viewport-was-given-unbounded-height
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(
            color: Colors.grey[150],
            height: 7,
            thickness: 2,
            indent: 10,
            endIndent: 0,
          ); /*2*/

          final index = i ~/ 2; /*3*/ 
          return _buildRow(clubsShuffeled[index], players[index]);
      });
  }

  Widget _buildRow(String team, String player) {
  return ListTile(
    title: Text(
      '$player -> $team',
      style: _biggerFont,
    ),
  );


}
}

class RandomTeams extends StatefulWidget {
  @override
  RandomTeamsState createState() => RandomTeamsState();
}
