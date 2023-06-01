import 'package:cameraapp/model/data_model.dart';
import 'package:cameraapp/screen/HomeScreen.dart';
import 'package:cameraapp/screen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(imagemodelAdapter().typeId)) {
    Hive.registerAdapter(imagemodelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
         home: SplashScreen()        );
  }
}
