import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:get/get.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/views/dashboard/profile_section.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class SideMenuCard extends StatelessWidget {
  const SideMenuCard({
    super.key,
    required this.sideMenu,
  });

  final SideMenuController sideMenu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: reusableContainerDecoration(),
        child: SideMenu(
          controller: sideMenu,
          style: SideMenuStyle(
            displayMode: SideMenuDisplayMode.auto,
            showHamburger: context.isLandscape ? true : false,
            hoverColor: AppColors.primaryColor,
            selectedColor: AppColors.blueTextColor,
            selectedTitleTextStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontStyle: FontStyle.normal,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            unselectedTitleTextStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontStyle: FontStyle.normal,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
            selectedIconColor: Colors.white,
          ),
          items: [
            SideMenuItem(
              title: 'Home',
              onTap: (index, _) {
                sideMenu.changePage(index);
              },
              icon: const Icon(CupertinoIcons.home),
              badgeContent: const Text(
                '3',
                style: TextStyle(color: Colors.white),
              ),
              tooltipContent: "This is a tooltip for Dashboard item",
            ),
            SideMenuExpansionItem(
              title: "Tasks",
              icon: const Icon(Icons.task),
              children: [
                SideMenuItem(
                  title: 'Start Task',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(FontAwesomeIcons.plus),
                  badgeContent: const Text(
                    '3',
                    style: TextStyle(color: Colors.white),
                  ),
                  tooltipContent: "Start Task",
                ),
                SideMenuItem(
                  title: 'View Task',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(FontAwesomeIcons.listCheck),
                  tooltipContent: "View Task",
                )
              ],
            ),
            SideMenuItem(
              title: 'Reports',
              onTap: (index, _) {
                sideMenu.changePage(index);
              },
              icon: const Icon(Symbols.lab_profile),
              trailing: Container(
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 3),
                    child: Text(
                      'New',
                      style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                    ),
                  )),
            ),
            SideMenuItem(
              title: 'Customize Units',
              onTap: (index, _) {
                sideMenu.changePage(index);
              },
              icon: const Icon(Symbols.dashboard_customize),
            ),
            SideMenuItem(
              title: 'Engines',
              onTap: (index, _) {
                sideMenu.changePage(index);
              },
              icon: const Icon(Symbols.manufacturing),
            ),
            SideMenuItem(
              builder: (context, displayMode) {
                return const Divider(endIndent: 8, indent: 8);
              },
            ),
            const SideMenuItem(
              title: 'Exit',
              icon: Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
    );
  }
}
