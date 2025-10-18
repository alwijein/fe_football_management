import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class MyFilePicker {
  /// Pick a single PDF file
  static Future<File?> pickFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      return File(result.files.single.path!);
    }
    return null; // User canceled
  }

  /// Pick multiple files (any type)
  static Future<List<File>?> pickMultipleFiles(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.any,
    );

    if (result != null && result.files.isNotEmpty) {
      return result.paths
          .whereType<String>() // Avoid nulls
          .map((path) => File(path))
          .toList();
    }
    return null; // User canceled
  }
}
