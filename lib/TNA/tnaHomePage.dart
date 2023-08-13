import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
// import 'package:open_file/open_file.dart';

import 'package:url_launcher/url_launcher.dart';

class tnaHomePage extends StatefulWidget {
  const tnaHomePage({super.key});

  @override
  State<tnaHomePage> createState() => _tnaHomePageState();
}

class _tnaHomePageState extends State<tnaHomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        elevation: 0,
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "T.N.A. ",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 45,
              color: Colors.green.shade400,
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 10),
            child: Container(
              height: screenheight / 5,
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: SizedBox(
                        height: 120,
                        width: 120,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade800,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          onPressed: () {
                            openFile();
                          },
                          child: Text(
                            "TNA- 1",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.amber.shade50,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5, left: 5),
                      child: SizedBox(
                        height: 120,
                        width: 120,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade800,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          onPressed: () {
                            openFile();
                          },
                          child: Text(
                            "TNA -2",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.amber.shade50,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: SizedBox(
                        height: 120,
                        width: 120,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade800,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "TNA -3",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.amber.shade50,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, right: 15, left: 15),
            child: Container(
              color: Colors.grey.shade900,
              height: screenheight / 3,
              width: screenWidth / 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey.shade800,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: () {
                  openFile();
                },
                child: Text(
                  "OPEN DIRECTORY",
                  style: GoogleFonts.montserrat(
                    // fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.amber.shade50,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future openFile() async {
  // Get the user's Documents directory
  Directory documentsDirectory = await getApplicationSupportDirectory();
  String documentsPath = documentsDirectory.path;

  // Let the user pick a file from the Documents directory
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    initialDirectory: documentsPath,
  );

  if (result != null) {
    // Get the file path
    String path = result.files.single.path!;
    final String fileName = '$path';
    OpenFilex.open(fileName);

    // Do something with the file
    print('File path: $path');
  } else {
    // User canceled the file picker
    print('User canceled');
  }
}
