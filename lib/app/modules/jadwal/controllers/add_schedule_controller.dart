import 'package:fe_football/app/modules/jadwal/data/models/schedule_request/schedule_request.dart';
import 'package:fe_football/app/modules/jadwal/domain/repositories/schedule_repository.dart';
import 'package:fe_football/app/modules/team/data/models/team/team.dart';
import 'package:fe_football/app/modules/team/domain/repositories/team_repository.dart';
import 'package:fe_football/utils/logging/common_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddScheduleController extends GetxController {
  final ScheduleRepository _scheduleRepository;
  final TeamRepository _teamRepository;

  AddScheduleController(this._scheduleRepository, this._teamRepository);

  final formKey = GlobalKey<FormState>();

  final Rxn<Team> selectedHomeTeam = Rxn<Team>();
  final Rxn<Team> selectedAwayTeam = Rxn<Team>();
  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);

  final RxList<Team> teams = <Team>[].obs;
  final RxList<Team> filteredTeams = <Team>[].obs;
  final RxBool isLoading = false.obs;

  final TextEditingController searchController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadTeams();
  }

  @override
  void onClose() {
    searchController.dispose();
    locationController.dispose();
    super.onClose();
  }

  Future<void> loadTeams() async {
    isLoading.value = true;
    final result = await _teamRepository.getTeams(page: 1, limit: 100);
    result.fold(
      (error) {
        Get.snackbar(
          'Error',
          error.message,
          backgroundColor: const Color(0xFFEF4444),
          colorText: const Color(0xFFFFFFFF),
        );
      },
      (response) {
        teams.value = response.data ?? [];
        filteredTeams.value = response.data ?? [];
      },
    );
    isLoading.value = false;
  }

  void filterTeams(String query) {
    if (query.isEmpty) {
      filteredTeams.value = teams;
    } else {
      filteredTeams.value = teams
          .where(
            (team) => team.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
  }

  void selectHomeTeam(Team team) {
    selectedHomeTeam.value = team;
    Get.back();
  }

  void selectAwayTeam(Team team) {
    selectedAwayTeam.value = team;
    Get.back();
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFFF63D68),
              onPrimary: Colors.white,
              surface: Color(0xFF1F2137),
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime.value ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFFF63D68),
              onPrimary: Colors.white,
              surface: Color(0xFF1F2137),
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedTime.value = picked;
    }
  }

  String? validateHomeTeam() {
    if (selectedHomeTeam.value == null) {
      return 'Home team harus dipilih';
    }
    return null;
  }

  String? validateAwayTeam() {
    if (selectedAwayTeam.value == null) {
      return 'Away team harus dipilih';
    }
    if (selectedHomeTeam.value != null &&
        selectedAwayTeam.value!.id == selectedHomeTeam.value!.id) {
      return 'Away team tidak boleh sama dengan home team';
    }
    return null;
  }

  Future<void> submitForm() async {
    if (selectedHomeTeam.value == null) {
      Get.snackbar(
        'Error',
        'Home team harus dipilih',
        backgroundColor: const Color(0xFFEF4444),
        colorText: const Color(0xFFFFFFFF),
      );
      return;
    }

    if (selectedAwayTeam.value == null) {
      Get.snackbar(
        'Error',
        'Away team harus dipilih',
        backgroundColor: const Color(0xFFEF4444),
        colorText: const Color(0xFFFFFFFF),
      );
      return;
    }

    if (selectedHomeTeam.value!.id == selectedAwayTeam.value!.id) {
      Get.snackbar(
        'Error',
        'Home team dan away team tidak boleh sama',
        backgroundColor: const Color(0xFFEF4444),
        colorText: const Color(0xFFFFFFFF),
      );
      return;
    }

    if (selectedDate.value == null) {
      Get.snackbar(
        'Error',
        'Tanggal pertandingan harus dipilih',
        backgroundColor: const Color(0xFFEF4444),
        colorText: const Color(0xFFFFFFFF),
      );
      return;
    }

    if (selectedTime.value == null) {
      Get.snackbar(
        'Error',
        'Waktu pertandingan harus dipilih',
        backgroundColor: const Color(0xFFEF4444),
        colorText: const Color(0xFFFFFFFF),
      );
      return;
    }

    isLoading.value = true;

    final matchDateTime = DateTime(
      selectedDate.value!.year,
      selectedDate.value!.month,
      selectedDate.value!.day,
      selectedTime.value!.hour,
      selectedTime.value!.minute,
    );

    final formattedDate =
        '${matchDateTime.year}-${matchDateTime.month.toString().padLeft(2, '0')}-${matchDateTime.day.toString().padLeft(2, '0')}';
    Log.debug(
      'Formatted Date: $formattedDate Format Time : ${selectedTime.value!.hour.toString().padLeft(2, '0')}:${selectedTime.value!.minute.toString().padLeft(2, '0')}',
    );
    final request = ScheduleRequest(
      homeTeamId: selectedHomeTeam.value!.id,
      awayTeamId: selectedAwayTeam.value!.id,
      matchDate: formattedDate,
      location: locationController.text.isEmpty
          ? 'TBD'
          : locationController.text,
      matchTime:
          '${selectedTime.value!.hour.toString().padLeft(2, '0')}:${selectedTime.value!.minute.toString().padLeft(2, '0')}',
    );

    final result = await _scheduleRepository.createSchedule(request);

    result.fold(
      (error) {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          error.message,
          backgroundColor: const Color(0xFFEF4444),
          colorText: const Color(0xFFFFFFFF),
        );
      },
      (response) {
        isLoading.value = false;
        Get.back(result: response.data);
        Get.snackbar(
          'Success',
          'Jadwal berhasil ditambahkan',
          backgroundColor: const Color(0xFF10B981),
          colorText: const Color(0xFFFFFFFF),
        );
      },
    );
  }
}
