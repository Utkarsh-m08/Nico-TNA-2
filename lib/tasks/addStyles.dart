// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nico_tna/Login/loginPage.dart';
import 'package:nico_tna/tasks/bodyFit.dart';
import 'package:nico_tna/tasks/bodyPP.dart';
import 'package:nico_tna/toDoList/home.dart';

class addStyles extends StatefulWidget {
  const addStyles({super.key});

  @override
  State<addStyles> createState() => _addStylesState();
}

class _addStylesState extends State<addStyles> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey[900],
          elevation: 0,
          title: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "New Styles ",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 45,
                color: Colors.green.shade50,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            MaterialButton(
              onPressed: () async {
                // PermissionStatus StorageStatus = await Permissions.storage.request() ;
              },
            ),
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.file_download_done_outlined,
                    color: Colors.grey.shade600,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.view_timeline,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            Expanded(
                child: TabBarView(
              children: [
                Container(
                  child: Center(
                    child: Scaffold(
                      body: bodypp(),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Scaffold(
                      body: bodyfit(),
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
