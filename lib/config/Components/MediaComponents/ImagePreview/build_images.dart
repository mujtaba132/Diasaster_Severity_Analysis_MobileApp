import 'dart:io';

import 'package:flutter/material.dart';


class FileImages extends StatelessWidget {
  final File file;
  const FileImages({super.key,required this.file});

  @override
  Widget build(BuildContext context) {

    print("I am here in Images of File Imagea----------${file.path}");
    return 
    file.path.isEmpty?
    Image.file(
        file,
        fit: BoxFit.cover,
      ):
    SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child:  Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
          SizedBox(height: 6),
          Text(
            "Image not found!!",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    ),
        ),
      );
  }
}
