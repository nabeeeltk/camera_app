
// ignore_for_file: use_build_context_synchronously

import 'package:cameraapp/screen/HomeScreen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    gotoHomeScreen();
    super.initState();
  }
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Text("PickUp!"),
       
      )
    );
  }

  Future<void> gotoHomeScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx)=>HomeScreen() ),
    );
  }
}
