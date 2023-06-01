import 'dart:developer';
import 'dart:io';

import 'package:cameraapp/db/fuctions/db_dbfuctions.dart';
import 'package:cameraapp/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String _images;

  Future opencamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemporary = image.path;
    // setState(() {
    //   image = imageTemporary;
    // });
    _images = imageTemporary;
    final imagePicked = imagemodel(image: _images);
    imageAdd(imagePicked);
  }

  @override
  Widget build(BuildContext context) {
    getallimage();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 49, 88),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 161, 197, 226),
        title: const Text("PickUp!",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          opencamera();
        },
        child: const Icon(Icons.camera),
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ValueListenableBuilder(
          valueListenable: imagelistNotifier,
          builder: (context, value, child) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    itemCount: imagelistNotifier.value.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text("Are you sure?"),
                                content: const Text("Do you want to delete?"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      deleteImages(index);
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(14),
                                      child: const Text("ok"),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Container(
                              child: Image.file(
                                  File(imagelistNotifier.value[index].image)),
                            ),
                          ),
                        )),
              )),
    );
  }
}
