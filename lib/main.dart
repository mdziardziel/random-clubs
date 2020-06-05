// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

final teams = ['BVB', 'PSG', 'JUVE', 'REAL', 'BARCA'];
final players = ['Tomek', 'Maciek', 'Antek'];

List<String> shuffledTeams() => (teams.toList()..shuffle()).take(players.length).toList();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fifa random teams',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: RandomTeams(),
        ),
      ),
    );
  }
}

class RandomTeamsState extends State<RandomTeams> {
  @override
  Widget build(BuildContext context) {
    final teams = shuffledTeams();
    return Text(teams.toString());
  }}

class RandomTeams extends StatefulWidget {
  @override
  RandomTeamsState createState() => RandomTeamsState();
}
