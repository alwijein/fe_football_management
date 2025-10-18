import 'package:fe_football/app/modules/login/data/data_sources/network/auth_network_impl.dart';
import 'package:fe_football/app/modules/login/data/models/login_request/login_request.dart';
import 'package:fe_football/app/modules/login/data/repositories/auth_repository_impl.dart';
import 'package:fe_football/app/modules/login/domain/repositories/auth_repository.dart';
import 'package:fe_football/app/routes/app_pages.dart';
import 'package:fe_football/utils/local_storage/common_shared_preferences.dart';
import 'package:fe_football/utils/logging/common_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Repository
  late final AuthRepository _authRepository;

  // Text editing controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Observable states
  final RxBool isPasswordVisible = false.obs;
  final RxBool isLoading = false.obs;
  final RxBool rememberMe = false.obs;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    _authRepository = AuthRepositoryImpl(AuthNetworkImpl());
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  /// Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// Toggle remember me
  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  /// Handle login action
  Future<void> handleLogin() async {
    if (formKey.currentState?.validate() ?? false) {
      if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
        Get.snackbar(
          'Error',
          'Please fill in all fields',
          backgroundColor: const Color(0xFFEF4444),
          colorText: const Color(0xFFFFFFFF),
        );
        return;
      }

      isLoading.value = true;

      final loginRequest = LoginRequest(
        username: usernameController.text,
        password: passwordController.text,
      );

      Log.debug('Login Request: ${loginRequest.toJson()}');

      final result = await _authRepository.login(loginRequest);

      isLoading.value = false;

      result.fold(
        (error) {
          // Error handling
          Get.snackbar(
            'Login Failed',
            error.message,
            backgroundColor: const Color(0xFFEF4444),
            colorText: const Color(0xFFFFFFFF),
          );
        },
        (response) {
          // Success handling
          // Save token to shared preferences
          CommonSharedPreferences.shared.save(
            CommonSharedPreferences.headerTokenKey,
            response.data.token,
          );

          // Save user data if needed
          CommonSharedPreferences.shared.save(
            'user_id',
            response.data.user.id.toString(),
          );

          CommonSharedPreferences.shared.save(
            'username',
            response.data.user.username,
          );
          CommonSharedPreferences.shared.save(
            'email',
            response.data.user.email,
          );
          CommonSharedPreferences.shared.save(
            'full_name',
            response.data.user.fullName,
          );

          Get.offAllNamed(Routes.NAVBAR);

          Get.snackbar(
            'Success',
            response.meta.message,
            backgroundColor: const Color(0xFF10B981),
            colorText: const Color(0xFFFFFFFF),
          );
        },
      );
    } else {
      return;
    }
  }
}
