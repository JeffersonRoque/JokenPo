import 'package:flutter/material.dart';
import 'package:jokenpo/jokenpo.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new jokenpo(),
        debugShowCheckedModeBanner: false,
    );
  }
}





