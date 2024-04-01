import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';

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
      child: ReUsableContainer(
        child: SideMenu(
          controller: sideMenu,
          style: SideMenuStyle(
            compactSideMenuWidth: 200,
            displayMode: SideMenuDisplayMode.open,
            showHamburger: false,
            itemInnerSpacing: 8.0,
            hoverColor: AppColors.primaryColor,
            selectedColor: AppColors.blueTextColor,
            toggleColor: Colors.red,
            selectedIconColor: Colors.white,
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
          ),
          title: Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 120,
                  maxWidth: 120,
                ),
                child: Image.asset(
                  'assets/images/app-logo.png',
                ),
              ),
              CustomTextWidget(
                text: 'Mechanix',
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              const Divider(
                indent: 8.0,
                endIndent: 8.0,
              ),
            ],
          ),
          items: [
            SideMenuItem(
                title: 'Home',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(CupertinoIcons.home)),
            SideMenuItem(
              builder: (context, displayMode) {
                return const Divider(endIndent: 8, indent: 8);
              },
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
              trailing: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
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
              title: 'Profile',
              icon: Icon(Symbols.person_2_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
