import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class CamerPicker extends StatefulWidget {
  

  @override
  _CamerPickerState createState() => _CamerPickerState();
}

class _CamerPickerState extends State<CamerPicker> {
  Future<File> imageFile;
  File _image;
  String result = '';
  ImagePicker imagePicker;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
    loadDataModelFiles();
  }
  void loadDataModelFiles() async {
     String output = await Tflite.loadModel(
      model: "assets/converted_tflite/pokemon_xyzknn.tflite",
      labels: "assets/converted_tflite/labels.txt",
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false
    );
  }

  void doImageClassification() async{
    var recognition = await Tflite.runModelOnImage(
        path: _image.path,
        imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.5,
      asynch: true
    );
    print(recognition.length.toString());
    setState(() {
      result = "";
    });
    recognition.forEach((element) {
      setState(() {
        print(element.toString());
        result += element["label"];
      });
    });
  }

  capturePhoto() async{
    PickedFile pickedFile =
    await imagePicker.getImage(source: ImageSource.camera);
    _image = File(pickedFile.path);
    setState(() {
      _image;
      doImageClassification();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover
            )
          ),
          child: Column(
            children: [
              SizedBox(width: 100),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Stack(children: <Widget>[
                  Center(
                    child: FlatButton(
                      onPressed: capturePhoto,
                      child: Container(
                        margin: EdgeInsets.only(top: 30, right: 35, left: 18),
                        child: _image != null
                        ? Image.file(
                          _image,
                        height: 160,
                        width: 400,
                        fit: BoxFit.cover,
                        )
                          : Container(
                            width: 140,
                            height: 190,
                          child: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                        ),
                        ),
                      ),
                    ),
                  ),
                ],),
              ),
              SizedBox(height: 160),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  '$result',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Brand Bold',
                      fontSize: 40,
                      color: Colors.pinkAccent,
                      backgroundColor: Colors.white60),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}