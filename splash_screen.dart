import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:privana/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    //TODO Splash Logic
_timer = Timer(const Duration(seconds: 5), (){ 
  //TODO Navigate
  Navigator.push(context, 
  MaterialPageRoute(builder: (context) => HomePage()),);
});
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _timer?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF007AFF),
      body: Stack(
        children: [
          Center(
            child: Image.asset("images/logo.png"),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
             color: Color.fromARGB(255, 34, 28, 88).withOpacity(0.5),
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Text(
                "FROM TELESOFT",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      )
      )
    ;
  }
}
