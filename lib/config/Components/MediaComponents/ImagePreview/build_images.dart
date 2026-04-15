import 'dart:io';

import 'package:flutter/material.dart';

class NetworkImages extends StatelessWidget {
  final String filePath;
  const NetworkImages({super.key,required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Image.network(
        filePath,
        fit: BoxFit.contain,
        width: double.infinity,
        height: double.infinity,
      );
  }
}

class FileImages extends StatelessWidget {
  final File file;
  const FileImages({super.key,required this.file});

  @override
  Widget build(BuildContext context) {
    return Image.file(
        file,
        fit: BoxFit.contain,
        width: double.infinity,
        height: double.infinity,
      );
  }
}
