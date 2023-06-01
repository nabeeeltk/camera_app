
import 'package:cameraapp/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<imagemodel>> imagelistNotifier = ValueNotifier([]);
Future<void> imageAdd(imagemodel value) async {
  final ImageDB = await Hive.openBox<imagemodel>("image_db");

  final id = await ImageDB.add(value);
  value.id = id;

  imagelistNotifier.value.add(value);
  await ImageDB.put(id, value);

  imagelistNotifier.notifyListeners();
  getallimage();
}

Future<void> getallimage() async {
  final ImageDB = await Hive.openBox<imagemodel>("image_db");
  // imagelistNotifier.value.add(ImageDB.values as imagemodel);
  imagelistNotifier.value.clear();
  imagelistNotifier.value.addAll(ImageDB.values);
  imagelistNotifier.notifyListeners();
}

Future<void> deleteImages(int index) async {
  final ImageDB = await Hive.openBox<imagemodel>("image_db");
  ImageDB.deleteAt(index);
  getallimage();
}
