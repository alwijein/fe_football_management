import 'dart:io';
import 'package:fe_football/app/modules/team/data/models/player_request/player_request.dart';
import 'package:fe_football/app/modules/team/domain/repositories/team_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

enum AddPlayerState { initial, loading, success, error }

class AddPlayerController extends GetxController {
  final TeamRepository _teamRepository;

  AddPlayerController(this._teamRepository);

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController jerseyNumberController = TextEditingController();

  // Team ID from arguments (sent from TeamDetailController)
  late final int teamId;
  final RxString selectedPosition = ''.obs;

  // State Management
  final Rx<AddPlayerState> submitState = AddPlayerState.initial.obs;
  final RxString submitError = ''.obs;

  final List<String> positions = [
    'Penyerang',
    'Gelandang',
    'Bertahan',
    'Penjaga Gawang',
  ];

  @override
  void onInit() {
    super.onInit();
    teamId = Get.arguments as int; // Get team ID from arguments
  }

  @override
  void onClose() {
    nameController.dispose();
    heightController.dispose();
    weightController.dispose();
    jerseyNumberController.dispose();
    super.onClose();
  }

  void selectPosition(String position) {
    selectedPosition.value = position;
    Get.back();
  }

  void showPositionPicker() {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih Posisi',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ...positions.map((position) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  position,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                onTap: () => selectPosition(position),
              );
            }),
          ],
        ),
      ),
    );
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama pemain tidak boleh kosong';
    }
    if (value.length < 3) {
      return 'Nama pemain minimal 3 karakter';
    }
    return null;
  }

  String? validateHeight(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tinggi badan tidak boleh kosong';
    }
    final height = int.tryParse(value);
    if (height == null) {
      return 'Tinggi badan harus berupa angka';
    }
    if (height < 100 || height > 250) {
      return 'Tinggi badan tidak valid';
    }
    return null;
  }

  String? validateWeight(String? value) {
    if (value == null || value.isEmpty) {
      return 'Berat badan tidak boleh kosong';
    }
    final weight = int.tryParse(value);
    if (weight == null) {
      return 'Berat badan harus berupa angka';
    }
    if (weight < 40 || weight > 150) {
      return 'Berat badan tidak valid';
    }
    return null;
  }

  String? validateJerseyNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor punggung tidak boleh kosong';
    }
    final number = int.tryParse(value);
    if (number == null) {
      return 'Nomor punggung harus berupa angka';
    }
    if (number < 1 || number > 99) {
      return 'Nomor punggung harus antara 1-99';
    }
    return null;
  }

  Future<void> submitForm() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (selectedPosition.value.isEmpty) {
      submitState.value = AddPlayerState.error;
      submitError.value = 'Posisi pemain harus dipilih';
      return;
    }

    submitState.value = AddPlayerState.loading;
    submitError.value = '';

    final result = await _teamRepository.createPlayer(
      teamId,
      playerRequest: PlayerRequest(
        name: nameController.text,
        height: int.parse(heightController.text),
        weight: int.parse(weightController.text),
        position: selectedPosition.value,
        jerseyNumber: int.parse(jerseyNumberController.text),
      ),
    );

    result.fold(
      (failure) {
        submitState.value = AddPlayerState.error;
        submitError.value = failure.message;
      },
      (response) {
        submitState.value = AddPlayerState.success;
        // Return to previous screen with success result
        Future.delayed(const Duration(milliseconds: 500), () {
          Get.back(result: true);
        });
      },
    );
  }
}
