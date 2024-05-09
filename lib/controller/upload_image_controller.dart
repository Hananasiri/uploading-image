import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ImageController extends GetxController {
  File? pickedFileApp;
  bool isLoading = false;

  double scale = 1.0;
  Offset previousOffset = Offset.zero;
  Offset offset = Offset.zero;

  pickPDFFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      pickedFileApp = File(result.files.single.path!);
      update();
    }
  }

  Future<void> saveImage(File imageFile) async {
    final bytes = await imageFile.readAsBytes();
    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(bytes));
    if (result['isSuccess']) {
      print('Image saved successfully');
    } else {
      print('Failed to save image: ${result['error']}');
    }
  }
}
