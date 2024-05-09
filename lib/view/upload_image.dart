import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/upload_image_controller.dart';

class UploadImageScreen extends StatelessWidget {
  UploadImageScreen({super.key});

  final imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Flutter Image Upload "),
      ),
      body: Center(
        child: GetBuilder<ImageController>(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: imageController.pickedFileApp != null
                    ? InteractiveViewer(
                        boundaryMargin: EdgeInsets.all(20.0),
                        minScale: 0.5,
                        maxScale: 2.0,
                        child: Image.file(
                          File(imageController.pickedFileApp!.path),
                          fit: BoxFit.contain,
                        ),
                      )
                    : const Text('No image selected'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0, left: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        imageController.pickPDFFile();
                      },
                      child: const Text("Upload image"),
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
