// lib/class_page.dart
import 'package:flutter/material.dart';

class ClassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classes'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Classes Page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
