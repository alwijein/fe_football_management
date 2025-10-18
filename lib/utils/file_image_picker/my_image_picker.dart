import 'dart:io';

import 'package:fe_football/utils/logging/common_log.dart';
import 'package:image_picker/image_picker.dart';

class MyImagePicker {
  static Future<File> pickImageFromGallery() async {
    return await _pickImage(ImageSource.gallery);
  }

  static Future<File> pickImageFromCamera() async {
    return await _pickImage(ImageSource.camera);
  }

  static Future<File> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: source,
        imageQuality: 20,
      );

      if (pickedFile == null) {
        return File('');
      }

      return File(pickedFile.path);
    } catch (e) {
      Log.debug("Error picking image: $e");
      return File('');
    }
  }
}
