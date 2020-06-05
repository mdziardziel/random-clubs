// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random clubs',
  	  home: RandomTeams()
    );
  }
}

class Pair {
  String _club = '';
  String _player = '';

  Pair(String club, String player) {
    this._club = club;
    this._player = player;
  }

  String getPlayer() => this._player;
  String getClub() => this._club;
}

class RandomTeamsState extends State<RandomTeams> {
  List<String> clubs = [];
  List<String> players = [];
  List<Pair> pairsShuffeled = [];

  final _biggerFont = const TextStyle(fontSize: 18.0);
  final TextEditingController clubInputCtrl = new TextEditingController();
  final TextEditingController playerInputCtrl = new TextEditingController();

  void shufflePairs(clubs, players) {
    pairsShuffeled = [];
    int pairsNum = min(clubs.length, players.length);
    List<String> clubsShuffeled = (clubs.toList()..shuffle()).take(pairsNum).toList();
    List<String> playersShuffeled = (players.toList()..shuffle()).take(pairsNum).toList();

    for(int i = 0; i < pairsNum; i++) {
      Pair pair = new Pair(clubsShuffeled[i], playersShuffeled[i]);
      pairsShuffeled.add(pair);
    }
  }

  @override
  Widget build(BuildContext context) {    
      return Scaffold(
        appBar: AppBar(
          title: Text('Random clubs'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _clubsInput(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _playersInput(),
            ),
            _buildPairs(),
          ]
        ),
      );
  }

  Widget _clubsInput() {
    return TextField(
      controller: clubInputCtrl,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Add club',
        helperText: clubs.join(', '),
      ),
      onSubmitted: (text) {
        clubs.add(text);  // Append Text to the list
        shufflePairs(clubs, players);
        clubInputCtrl.clear();     // Clear the Text area
        setState(() {});   // Redraw the Stateful Widget
      }
    );
  }

  Widget _playersInput() {
    return TextField(
      controller: playerInputCtrl,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Add player',
        helperText: players.join(', '),
      ),
      onSubmitted: (text) {
        players.add(text);  // Append Text to the list
        shufflePairs(clubs, players);
        playerInputCtrl.clear();     // Clear the Text area
        setState(() {});   // Redraw the Stateful Widget
      }
    );
  }

  Widget _buildPairs() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: pairsShuffeled.length * 2,
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

          return _buildRow(pairsShuffeled[index].getClub(), pairsShuffeled[index].getPlayer());
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
