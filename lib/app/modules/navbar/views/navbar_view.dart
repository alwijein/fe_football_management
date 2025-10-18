import 'package:fe_football/app/modules/home/views/home_view.dart';
import 'package:fe_football/app/modules/jadwal/views/jadwal_view.dart';
import 'package:fe_football/app/modules/profil/views/profil_view.dart';
import 'package:fe_football/app/modules/team/views/team_view.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:fe_football/utils/assets/common_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  const NavbarView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.currentIndex,
            children: [HomeView(), JadwalView(), TeamView(), ProfilView()],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: ColorSchemaCollections.primary.surface,
            elevation: 1,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: TypographyCollections.primaryTextStyle.copyWith(
              fontSize: 12,
              color: ColorSchemaCollections.primary.primary,
              height: 3,
            ),
            unselectedLabelStyle: TypographyCollections.subtitleTextStyle
                .copyWith(fontSize: 12, height: 3),
            unselectedItemColor: ColorSchemaCollections.primary.disabled,
            selectedItemColor: ColorSchemaCollections.primary.primary,
            currentIndex: controller.currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: controller.changeTabIndex,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SvgPicture.asset(
                    CommonIcons.icHome,
                    color: controller.currentIndex == 0
                        ? ColorSchemaCollections.primary.primary
                        : ColorSchemaCollections.primary.disabled,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SvgPicture.asset(
                    CommonIcons.icJadwal,
                    color: controller.currentIndex == 1
                        ? ColorSchemaCollections.primary.primary
                        : ColorSchemaCollections.primary.disabled,
                  ),
                ),
                label: 'Jadwal',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SvgPicture.asset(
                    CommonIcons.icTeam,
                    color: controller.currentIndex == 2
                        ? ColorSchemaCollections.primary.primary
                        : ColorSchemaCollections.primary.disabled,
                  ),
                ),
                label: 'Team',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SvgPicture.asset(
                    CommonIcons.icAccount,
                    color: controller.currentIndex == 3
                        ? ColorSchemaCollections.primary.primary
                        : ColorSchemaCollections.primary.disabled,
                  ),
                ),
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }
}
