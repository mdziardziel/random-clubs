// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import "dart:math";

final _random = new Random();

final teams = ['BVB', 'PSG', 'JUVE', 'REAL', 'BARCA'];

String randomTeam() => teams[_random.nextInt(teams.length)];

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
          child: Text(randomTeam()),
        ),
      ),
    );
  }
}

