import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:nico_tna/HomePage/homePage.dart';
import 'package:nico_tna/Login/loginPage.dart';
import 'package:nico_tna/TNA/tnaHomePage.dart';
import 'package:nico_tna/tasks/addStyles.dart';
import 'package:nico_tna/toDoList/home.dart';

class navBar extends StatefulWidget {
  const navBar({super.key});

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  List<ScreenHiddenDrawer> _pages = [];
  final myTextStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.grey.shade900,
  );

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: 'DASHBOARD',
            baseStyle: myTextStyle,
            selectedStyle: myTextStyle,
            colorLineSelected: Colors.grey.shade900),
        homePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          colorLineSelected: Colors.grey.shade900,
          name: 'TNA STATUS',
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
        ),
        addStyles(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          colorLineSelected: Colors.grey.shade900,
          name: 'TO-DO LIST',
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
        ),
        Home(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          colorLineSelected: Colors.grey.shade900,
          name: 'NICO DATABASE',
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
        ),
        tnaHomePage(),
      ),
    ];
  }

  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.green.shade400,
      backgroundColorAppBar: Colors.grey.shade900,
      verticalScalePercent: 97,
      elevationAppBar: 0,
      tittleAppBar: Text(
        '',
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.white,
        ),
      ),
      screens: _pages,
      initPositionSelected: 0,
      slidePercent: 60,
    );
  }
}
