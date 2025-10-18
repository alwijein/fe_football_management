import 'dart:io';
import 'package:fe_football/app/modules/profil/data/models/profile/profile.dart';
import 'package:fe_football/app/modules/profil/data/models/profile_request/profile_request.dart';
import 'package:fe_football/app/modules/profil/domain/repositories/profile_repository.dart';
import 'package:fe_football/app/modules/widgets/confirmation_dialog.dart';
import 'package:fe_football/utils/local_storage/common_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

enum ProfileDataState { initial, loading, success, error, empty }

enum UpdateProfileState { initial, loading, success, error }

enum ChangePasswordState { initial, loading, success, error }

enum LogoutState { initial, loading, success, error }

class ProfilController extends GetxController {
  final ProfileRepository _profileRepository;

  ProfilController(this._profileRepository);

  // State management
  final Rx<ProfileDataState> profileDataState = ProfileDataState.initial.obs;
  final Rxn<Profile> profile = Rxn<Profile>();
  final RxString profileError = ''.obs;

  final Rx<UpdateProfileState> updateProfileState =
      UpdateProfileState.initial.obs;
  final RxString updateProfileError = ''.obs;

  final Rx<ChangePasswordState> changePasswordState =
      ChangePasswordState.initial.obs;
  final RxString changePasswordError = ''.obs;

  final Rx<LogoutState> logoutState = LogoutState.initial.obs;
  final RxString logoutError = ''.obs;

  // Form controllers for edit profile
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Form controllers for change password
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final passwordFormKey = GlobalKey<FormState>();

  // Password visibility
  final RxBool isOldPasswordVisible = false.obs;
  final RxBool isNewPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;

  // Photo management
  final Rxn<File> selectedPhotoFile = Rxn<File>();
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  // Load profile data
  Future<void> loadProfile() async {
    profileDataState.value = ProfileDataState.loading;
    profileError.value = '';

    final result = await _profileRepository.getProfile();

    result.fold(
      (failure) {
        profileDataState.value = ProfileDataState.error;
        profileError.value = failure.message;
      },
      (response) {
        if (response.data != null) {
          profile.value = response.data;
          _populateFormFields();
          profileDataState.value = ProfileDataState.success;
        } else {
          profileDataState.value = ProfileDataState.empty;
        }
      },
    );
  }

  // Populate form fields with current profile data
  void _populateFormFields() {
    if (profile.value != null) {
      fullNameController.text = profile.value!.fullName;
      usernameController.text = profile.value!.username;
      emailController.text = profile.value!.email;
    }
  }

  // Image picker methods
  Future<void> pickImageFromGallery() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        selectedPhotoFile.value = File(pickedFile.path);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal memilih foto: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> pickImageFromCamera() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        selectedPhotoFile.value = File(pickedFile.path);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal mengambil foto: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void showImageSourcePicker() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xFF1E1E2E),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.white),
              title: const Text(
                'Pilih dari Galeri',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.back();
                pickImageFromGallery();
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.white),
              title: const Text(
                'Ambil Foto',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.back();
                pickImageFromCamera();
              },
            ),
          ],
        ),
      ),
    );
  }

  // Update profile
  Future<void> updateProfile() async {
    if (!formKey.currentState!.validate()) return;

    updateProfileState.value = UpdateProfileState.loading;
    updateProfileError.value = '';

    final result = await _profileRepository.updateProfile(
      fullName: fullNameController.text,
      username: usernameController.text,
      email: emailController.text,
      photoFile: selectedPhotoFile.value,
    );

    result.fold(
      (failure) {
        updateProfileState.value = UpdateProfileState.error;
        updateProfileError.value = failure.message;
      },
      (response) {
        updateProfileState.value = UpdateProfileState.success;
        if (response.data != null) {
          profile.value = response.data;
        }
        // Clear selected photo after success
        selectedPhotoFile.value = null;
        // Reload profile to get latest data
        Future.delayed(const Duration(seconds: 2), () {
          updateProfileState.value = UpdateProfileState.initial;
          Get.back(); // Close edit screen
        });
      },
    );
  }

  // Change password
  Future<void> changePassword() async {
    if (!passwordFormKey.currentState!.validate()) return;

    changePasswordState.value = ChangePasswordState.loading;
    changePasswordError.value = '';

    final request = ChangePasswordRequest(
      oldPassword: oldPasswordController.text,
      newPassword: newPasswordController.text,
      newPasswordConfirmation: confirmPasswordController.text,
    );

    final result = await _profileRepository.changePassword(request);

    result.fold(
      (failure) {
        changePasswordState.value = ChangePasswordState.error;
        changePasswordError.value = failure.message;
      },
      (response) {
        changePasswordState.value = ChangePasswordState.success;
        // Clear password fields
        oldPasswordController.clear();
        newPasswordController.clear();
        confirmPasswordController.clear();
        // Close dialog after success
        Future.delayed(const Duration(seconds: 2), () {
          changePasswordState.value = ChangePasswordState.initial;
          Get.back();
        });
      },
    );
  }

  // Logout
  Future<void> logout() async {
    logoutState.value = LogoutState.loading;
    logoutError.value = '';

    final result = await _profileRepository.logout();

    result.fold(
      (failure) {
        logoutState.value = LogoutState.error;
        logoutError.value = failure.message;
      },
      (response) {
        // remove saved token and user data
        CommonSharedPreferences.shared.cleanData();

        logoutState.value = LogoutState.success;
        Get.offAllNamed('/login');
      },
    );
  }

  // Show logout confirmation dialog
  void showLogoutDialog() async {
    final confirmed = await ConfirmationDialog.showLogout();

    if (confirmed == true) {
      logout();
    }
  }

  // Validators
  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama lengkap tidak boleh kosong';
    }
    if (value.length < 3) {
      return 'Nama lengkap minimal 3 karakter';
    }
    return null;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username tidak boleh kosong';
    }
    if (value.length < 3) {
      return 'Username minimal 3 karakter';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Format email tidak valid';
    }
    return null;
  }

  String? validateOldPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password lama tidak boleh kosong';
    }
    return null;
  }

  String? validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password baru tidak boleh kosong';
    }
    if (value.length < 6) {
      return 'Password baru minimal 6 karakter';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Konfirmasi password tidak boleh kosong';
    }
    if (value != newPasswordController.text) {
      return 'Password tidak cocok';
    }
    return null;
  }

  // Navigate to edit profile
  void navigateToEditProfile() {
    Get.toNamed('/profil/edit');
  }

  // Navigate to change password
  void navigateToChangePassword() {
    Get.toNamed('/profil/change-password');
  }
}
