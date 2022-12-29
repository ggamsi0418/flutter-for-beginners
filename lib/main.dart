import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 10, // AppBar 하단 음영
          shadowColor: Color.fromARGB(235, 65, 180, 233),
          title: Text('Hello Flutter!!'),
        ),
        body: Center(
          child: Text('Hello Wolrd!!'),
        ),
      ),
    );
  }
}
