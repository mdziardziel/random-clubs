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
  static final teamsStart = ['BVB', 'PSG', 'JUVE', 'REAL', 'BARCA', 'MANU', 'BAYERN'];
  static final players = ['Tomek', 'Maciek', 'Antek', 'Jacek', 'Grześ'];

  static List<String> shuffledTeams() => (teamsStart.toList()..shuffle()).take(players.length).toList();

  final _teams = shuffledTeams();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {    
      return Scaffold(
        appBar: AppBar(
          title: Text('Random teams'),
        ),
        body: _buildPairs(),
      );
  }

  Widget _buildPairs() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: players.length * 2 - 1,
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(
            color: Colors.grey[150],
            height: 7,
            thickness: 2,
            indent: 10,
            endIndent: 0,
          ); /*2*/

          final index = i ~/ 2; /*3*/ 
          return _buildRow(_teams[index], players[index]);
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
