import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class img_pickar extends StatefulWidget {
  const img_pickar({Key? key}) : super(key: key);

  @override
  State<img_pickar> createState() => _img_pickarState();
}

class _img_pickarState extends State<img_pickar> {
  XFile? _pickImage1;

  chooseImageFromGallery() async {
    final ImagePicker _pickar = ImagePicker();
    _pickImage1 = await _pickar.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Container(
        height: 400,
        width: 400,
        child: Material(
          child: Center(
            child: _pickImage1 == null
                ? IconButton(
                    onPressed: () {
                      chooseImageFromGallery();
                    },
                    icon: Icon(Icons.image),
                  )
                : Image.file(
                    File(_pickImage1!.path),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      )),
    );
  }
}
