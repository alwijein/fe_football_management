import 'package:fe_football/app/modules/jadwal/data/models/schedule/schedule.dart';
import 'package:fe_football/app/modules/jadwal/data/models/schedule_request/schedule_request.dart';
import 'package:fe_football/app/modules/jadwal/data/models/scorer/scorer.dart';
import 'package:fe_football/app/modules/jadwal/data/models/scorer_request/scorer_request.dart';
import 'package:fe_football/app/modules/jadwal/domain/repositories/schedule_repository.dart';
import 'package:fe_football/app/modules/team/data/models/player/player.dart';
import 'package:fe_football/app/modules/team/domain/repositories/team_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ScheduleDetailState { initial, loading, success, error, empty }

enum MatchResultState { initial, loading, success, error }

enum ScorerState { initial, loading, success, error }

enum DeleteScheduleState { initial, loading, success, error }

class ScheduleDetailController extends GetxController {
  final ScheduleRepository _scheduleRepository;
  final TeamRepository _teamRepository;

  ScheduleDetailController(this._scheduleRepository, this._teamRepository);

  // Schedule State
  late final Rxn<Schedule> schedule;

  // Scorers State
  final Rx<ScheduleDetailState> scorersState = ScheduleDetailState.initial.obs;
  final RxString scorersError = ''.obs;
  final scorers = RxList<Scorer>();

  // Players State
  final Rx<ScheduleDetailState> playersState = ScheduleDetailState.initial.obs;
  final RxString playersError = ''.obs;
  final players = RxList<Player>();

  // Match Result State
  final Rx<MatchResultState> matchResultState = MatchResultState.initial.obs;
  final RxString matchResultError = ''.obs;

  // Add Scorer State
  final Rx<ScorerState> addScorerState = ScorerState.initial.obs;
  final RxString addScorerError = ''.obs;

  // Delete Schedule State
  final Rx<DeleteScheduleState> deleteScheduleState =
      DeleteScheduleState.initial.obs;
  final RxString deleteScheduleError = ''.obs;

  final TextEditingController homeScoreController = TextEditingController();
  final TextEditingController awayScoreController = TextEditingController();
  final TextEditingController minuteController = TextEditingController();

  final Rxn<Player> selectedPlayer = Rxn<Player>();

  @override
  void onInit() {
    super.onInit();
    final scheduleArg = Get.arguments as Schedule?;
    schedule = Rxn<Schedule>(scheduleArg);

    if (schedule.value != null) {
      loadPlayers();
      loadScorers();
    }
  }

  @override
  void onClose() {
    homeScoreController.dispose();
    awayScoreController.dispose();
    minuteController.dispose();
    super.onClose();
  }

  Future<void> loadPlayers() async {
    if (schedule.value == null) return;

    playersState.value = ScheduleDetailState.loading;
    playersError.value = '';

    final homeTeamId = schedule.value!.homeTeam.id;
    final awayTeamId = schedule.value!.awayTeam.id;

    try {
      // Load players from both teams
      final homePlayersResult = await _teamRepository.getTeamPlayers(
        homeTeamId,
      );
      final awayPlayersResult = await _teamRepository.getTeamPlayers(
        awayTeamId,
      );

      homePlayersResult.fold(
        (failure) {
          playersState.value = ScheduleDetailState.error;
          playersError.value = failure.message;
        },
        (homeResponse) {
          awayPlayersResult.fold(
            (failure) {
              playersState.value = ScheduleDetailState.error;
              playersError.value = failure.message;
            },
            (awayResponse) {
              final allPlayers = [...?homeResponse.data, ...?awayResponse.data];

              if (allPlayers.isEmpty) {
                playersState.value = ScheduleDetailState.empty;
              } else {
                players.value = allPlayers;
                playersState.value = ScheduleDetailState.success;
              }
            },
          );
        },
      );
    } catch (e) {
      playersState.value = ScheduleDetailState.error;
      playersError.value = 'Terjadi kesalahan: $e';
    }
  }

  Future<void> loadScorers() async {
    if (schedule.value == null) return;

    scorersState.value = ScheduleDetailState.loading;
    scorersError.value = '';

    final result = await _scheduleRepository.getMatchScorers(
      schedule.value!.id,
    );

    result.fold(
      (failure) {
        scorersState.value = ScheduleDetailState.error;
        scorersError.value = failure.message;
      },
      (response) {
        final data = response.data ?? [];
        if (data.isEmpty) {
          scorersState.value = ScheduleDetailState.empty;
        } else {
          scorers.value = data;
          scorersState.value = ScheduleDetailState.success;
        }
      },
    );
  }

  void showMatchResultForm() {
    if (schedule.value == null) return;

    homeScoreController.clear();
    awayScoreController.clear();

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
              'Input Hasil Pertandingan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        schedule.value!.homeTeam.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: homeScoreController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: '0',
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          filled: true,
                          fillColor: const Color(0xFF252842),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        schedule.value!.awayTeam.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: awayScoreController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: '0',
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          filled: true,
                          fillColor: const Color(0xFF252842),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: submitMatchResult,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF63D68),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'SIMPAN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void showAddScorerForm() {
    minuteController.clear();
    selectedPlayer.value = null;

    Get.bottomSheet(
      Container(
        height: Get.height * 0.7,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Color(0xFF1F2137),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tambah Pencetak Gol',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pilih Pemain',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Obx(
              () => GestureDetector(
                onTap: _showPlayerPicker,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF252842),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF2F3348),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          selectedPlayer.value != null
                              ? '${selectedPlayer.value!.jerseyNumber} - ${selectedPlayer.value!.name}'
                              : 'Pilih pemain',
                          style: TextStyle(
                            color: selectedPlayer.value != null
                                ? Colors.white
                                : Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Menit',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: minuteController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Contoh: 23',
                hintStyle: TextStyle(color: Colors.grey[600]),
                filled: true,
                fillColor: const Color(0xFF252842),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: submitScorer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF63D68),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'SIMPAN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void _showPlayerPicker() {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.6,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Color(0xFF1F2137),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih Pemain',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: players.length,
                itemBuilder: (context, index) {
                  final player = players[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    title: Text(
                      '${player.jerseyNumber} - ${player.name}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      player.team?.name ?? '',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    onTap: () {
                      selectedPlayer.value = player;
                      Get.back();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  Future<void> submitMatchResult() async {
    if (schedule.value == null) return;

    if (homeScoreController.text.isEmpty || awayScoreController.text.isEmpty) {
      matchResultError.value = 'Semua field harus diisi';
      return;
    }

    matchResultState.value = MatchResultState.loading;
    matchResultError.value = '';

    final request = UpdateResultRequest(
      homeScore: int.parse(homeScoreController.text),
      awayScore: int.parse(awayScoreController.text),
      status: 'Completed',
    );

    final result = await _scheduleRepository.updateMatchResult(
      schedule.value!.id,
      request,
    );

    result.fold(
      (failure) {
        matchResultState.value = MatchResultState.error;
        matchResultError.value = failure.message;
      },
      (response) {
        matchResultState.value = MatchResultState.success;
        schedule.value = response.data;
        Get.back();
      },
    );
  }

  Future<void> submitScorer() async {
    if (schedule.value == null) return;

    if (selectedPlayer.value == null) {
      addScorerError.value = 'Pemain harus dipilih';
      return;
    }

    if (minuteController.text.isEmpty) {
      addScorerError.value = 'Menit harus diisi';
      return;
    }

    if (int.parse(minuteController.text) < 0 ||
        int.parse(minuteController.text) > 120) {
      addScorerError.value = 'Menit tidak valid';
      return;
    }

    addScorerState.value = ScorerState.loading;
    addScorerError.value = '';

    final request = ScorerRequest(
      playerId: selectedPlayer.value!.id,
      minute: int.parse(minuteController.text),
    );

    final result = await _scheduleRepository.addScorer(
      schedule.value!.id,
      request,
    );

    result.fold(
      (failure) {
        addScorerState.value = ScorerState.error;
        addScorerError.value = failure.message;
      },
      (response) {
        addScorerState.value = ScorerState.success;
        if (response.data != null) {
          scorers.add(response.data!);
          scorersState.value = ScheduleDetailState.success;
        }
        Get.back();
      },
    );
  }

  Future<void> deleteScorer(int scorerId) async {
    final result = await _scheduleRepository.deleteScorer(scorerId);

    result.fold(
      (failure) {
        scorersError.value = failure.message;
      },
      (_) {
        scorers.removeWhere((s) => s.id == scorerId);
        if (scorers.isEmpty) {
          scorersState.value = ScheduleDetailState.empty;
        }
      },
    );
  }

  Future<void> deleteSchedule() async {
    if (schedule.value == null) return;

    deleteScheduleState.value = DeleteScheduleState.loading;
    deleteScheduleError.value = '';

    final result = await _scheduleRepository.deleteSchedule(schedule.value!.id);

    result.fold(
      (failure) {
        deleteScheduleState.value = DeleteScheduleState.error;
        deleteScheduleError.value = failure.message;
      },
      (_) {
        deleteScheduleState.value = DeleteScheduleState.success;
        // Navigate back after short delay
        Future.delayed(const Duration(milliseconds: 1000), () {
          Get.back(result: true); // Send result to refresh previous screen
        });
      },
    );
  }
}
