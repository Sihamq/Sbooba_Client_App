import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TicketController extends GetxController {
  var subController = TextEditingController();
  List<XFile> imageFileList = [];
  final ImagePicker imagePicker = ImagePicker();
  void selectImages(context) async {
    // imageFileList = [];
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      if (selectedImages.length <= 3 && imageFileList.length <= 3) {
        imageFileList.addAll(selectedImages);
        update();

        print("takeImage");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Exceed allowed number"),
          ),
          // padding: const EdgeInsets.all(8),
          // duration: const Duration(milliseconds: 3000),
        );
      }
    } else {
      print("not selected");
    }
  }
}
