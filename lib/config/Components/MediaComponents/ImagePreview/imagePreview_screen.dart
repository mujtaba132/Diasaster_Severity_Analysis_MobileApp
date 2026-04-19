import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fyp_project/config/Components/Custom_Appbar.dart';
import 'package:fyp_project/config/Components/Custom_NetworkImage.dart';
import 'package:fyp_project/config/Components/MediaComponents/ImagePreview/build_images.dart';

class ImagePreviewScreen extends StatefulWidget {
  final File file; 
  final bool isNetwork;

  const ImagePreviewScreen({
    super.key,
    required this.file,
    this.isNetwork = false,
  });

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: CustomAppbar(title: widget.file.uri.pathSegments.last),
        body:  widget.isNetwork ? 
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Center(child: 
                     CustomNetworkimage(
                      imageUrl: widget.file.path,
                      )),
                   ):
                   FileImages(file: File(widget.file.path)),
        ),
    );
  }
}