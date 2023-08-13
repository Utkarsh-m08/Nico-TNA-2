import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:nico_tna/HomePage/homePage.dart';
import 'package:nico_tna/HomePage/navBar.dart';

const List<String> loginFeild = <String>['NICOBAR', 'VENDOR'];

class loginPage extends StatefulWidget {
  const loginPage({super.key});
  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  //controlers for id and password
  final _passwordController = TextEditingController();
  final _idController = TextEditingController();

  // referencing hive box
  final _myBox = Hive.box('mybox');

  String dropdownValue = loginFeild.first;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: screenheight / 10,
            ),
            Container(
              alignment: Alignment.topLeft,
              // decoration: BoxDecoration(color: Colors.green[400]),
              height: screenheight / 3,
              width: screenWidth / 1.2,
              child: Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/Tablet login-bro.png')),
            ),
            SizedBox(
              height: screenheight / 15,
            ),
            Container(
              height: screenheight / 10,
              width: screenWidth - (screenWidth / 10),
              child: Align(
                alignment: Alignment(-0.2, 0.5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Login  ",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 39,
                        color: Colors.white,
                      ),
                    ),
                    DropdownButton(
                      value: dropdownValue,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: Colors.white,
                      ),
                      icon: const Icon(Icons.downloading_rounded),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: loginFeild.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              height: screenheight / 2,
              width: screenWidth - screenWidth / 20,
              child: Align(
                alignment: Alignment(-0.6, 0.6),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, bottom: 2),
                      child: TextField(
                        controller: _idController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.green.shade400),
                            ),
                            labelText: 'Enter your ID',
                            helperText: 'your login id here'),
                        style: GoogleFonts.montserrat(
                          // fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 2, top: 10),
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.green.shade400),
                            ),
                            labelText: 'password',
                            helperText: 'your Password here'),
                        style: GoogleFonts.montserrat(
                          // fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: MaterialButton(
                        onPressed: () {
                          String pass = _myBox.get(_idController.toString());
                          if (pass == _passwordController.toString()) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => navBar()));
                            print('login ok');
                          } else {
                            print('login fail');
                          }
                          ;
                        },
                        height: 50,
                        color: Colors.green[400],
                        shape: CircleBorder(
                            eccentricity: 0.0, side: BorderSide.none),
                      ),
                    ),
                    // fake button for adding dummy values
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        onPressed: () {
                          register();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade400,
                          minimumSize: Size(60, 60),
                          elevation: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // saving data in accounnt would be done manually ther would be no signup button
  // but to add data intiallly i am creating a button and some feilds.

  void register() {
    _myBox.put(_idController.toString(), _passwordController.toString());
    print(_myBox.get(_idController.toString()));
  }

  // reading data [login id password] from database

  // referencing our box [database]
}
