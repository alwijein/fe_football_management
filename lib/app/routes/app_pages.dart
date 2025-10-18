import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jadwal/bindings/add_schedule_binding.dart';
import '../modules/jadwal/bindings/jadwal_binding.dart';
import '../modules/jadwal/bindings/schedule_detail_binding.dart';
import '../modules/jadwal/views/add_schedule_view.dart';
import '../modules/jadwal/views/jadwal_view.dart';
import '../modules/jadwal/views/schedule_detail_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/navbar/bindings/navbar_binding.dart';
import '../modules/navbar/views/navbar_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/profil/views/edit_profile_view.dart';
import '../modules/profil/views/change_password_view.dart';
import '../modules/team/bindings/add_player_binding.dart';
import '../modules/team/bindings/team_binding.dart';
import '../modules/team/bindings/team_detail_binding.dart';
import '../modules/team/views/add_player_view.dart';
import '../modules/team/views/add_team_view.dart';
import '../modules/team/views/team_detail_view.dart';
import '../modules/team/views/team_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR,
      page: () => const NavbarView(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL,
      page: () => const JadwalView(),
      binding: JadwalBinding(),
    ),
    GetPage(
      name: _Paths.ADD_SCHEDULE,
      page: () => const AddScheduleView(),
      binding: AddScheduleBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE_DETAIL,
      page: () => const ScheduleDetailView(),
      binding: ScheduleDetailBinding(),
    ),
    GetPage(
      name: _Paths.TEAM,
      page: () => const TeamView(),
      binding: TeamBinding(),
    ),
    GetPage(
      name: _Paths.TEAM_DETAIL,
      page: () => const TeamDetailView(),
      binding: TeamDetailBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PLAYER,
      page: () => const AddPlayerView(),
      binding: AddPlayerBinding(),
    ),

    GetPage(
      name: _Paths.ADD_TEAM,
      page: () => const AddTeamView(),
      binding: TeamBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => const ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ProfilBinding(),
    ),
  ];
}
