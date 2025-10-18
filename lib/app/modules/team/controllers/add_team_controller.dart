import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fe_football/app/modules/team/domain/repositories/team_repository.dart';

enum AddTeamState { initial, loading, success, error }

class AddTeamController extends GetxController {
  final TeamRepository _teamRepository;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController establishedYearController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final Rx<File?> logoFile = Rx<File?>(null);
  final RxString logoPath = ''.obs;

  // State Management
  final Rx<AddTeamState> state = AddTeamState.initial.obs;
  final RxString errorMessage = ''.obs;

  final ImagePicker _picker = ImagePicker();

  AddTeamController(this._teamRepository);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    establishedYearController.dispose();
    addressController.dispose();
    cityController.dispose();
    super.onClose();
  }

  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image != null) {
        logoFile.value = File(image.path);
        logoPath.value = image.path;
      }
    } catch (e) {
      errorMessage.value = 'Failed to pick image: $e';
    }
  }

  Future<void> takePhoto() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image != null) {
        logoFile.value = File(image.path);
        logoPath.value = image.path;
      }
    } catch (e) {
      errorMessage.value = 'Failed to take photo: $e';
    }
  }

  void removeLogo() {
    logoFile.value = null;
    logoPath.value = '';
  }

  void showImageSourceDialog() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Color(0xFF1F2137),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.white),
              title: const Text(
                'Gallery',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.back();
                pickImage();
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.white),
              title: const Text(
                'Camera',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.back();
                takePhoto();
              },
            ),
          ],
        ),
      ),
    );
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama team tidak boleh kosong';
    }
    if (value.length < 3) {
      return 'Nama team minimal 3 karakter';
    }
    return null;
  }

  String? validateYear(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tahun berdiri tidak boleh kosong';
    }
    final year = int.tryParse(value);
    if (year == null) {
      return 'Tahun berdiri harus berupa angka';
    }
    if (year < 1800 || year > DateTime.now().year) {
      return 'Tahun berdiri tidak valid';
    }
    return null;
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Alamat tidak boleh kosong';
    }
    return null;
  }

  String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Kota tidak boleh kosong';
    }
    return null;
  }

  Future<void> submitForm() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (logoFile.value == null) {
      state.value = AddTeamState.error;
      errorMessage.value = 'Logo team harus dipilih';
      return;
    }

    try {
      state.value = AddTeamState.loading;

      // Upload file dengan FormData (bukan string path)
      final result = await _teamRepository.createTeam(
        name: nameController.text,
        logoFile: logoFile.value!,
        establishedYear: int.parse(establishedYearController.text),
        address: addressController.text,
        city: cityController.text,
      );

      result.fold(
        (error) {
          state.value = AddTeamState.error;
          errorMessage.value = error.message;
        },
        (response) {
          state.value = AddTeamState.success;
          // Navigate back setelah delay singkat untuk user bisa lihat success state
          Future.delayed(const Duration(milliseconds: 1500), () {
            Get.back(result: true);
          });
        },
      );
    } catch (e) {
      state.value = AddTeamState.error;
      errorMessage.value = 'Terjadi kesalahan: $e';
    }
  }

  void resetState() {
    state.value = AddTeamState.initial;
    errorMessage.value = '';
  }
}
