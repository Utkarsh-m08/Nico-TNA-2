import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nico_tna/HomePage/navBar.dart';
import 'package:nico_tna/Login/loginPage.dart';
import 'package:nico_tna/tasks/pptodo.dart';
import 'package:nico_tna/tasks/pptodo_item.dart';
import 'package:nico_tna/toDoList/todo.dart';
import 'package:nico_tna/toDoList/todo_item.dart';

import 'package:url_launcher/url_launcher.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  // for pp

  List<ppToDo> _foundppToDo = [];
  final pptodosList = ppToDo.pptodoList();
  void _handleppToDoChange(ppToDo pptodo) {
    setState(() {
      pptodo.ppisDone = !pptodo.ppisDone;
    });
  }

  void _deleteppToDoItem(String ppid) {
    setState(() {
      pptodosList.removeWhere((item) => item.ppid == ppid);
    });
  }

  // for tasks
  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundppToDo = pptodosList;
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _handleToDoChange(ToDo todo) {
      setState(() {
        todo.isDone = !todo.isDone;
      });
    }

    void _deleteToDoItem(String id) {
      setState(() {
        todosList.removeWhere((item) => item.id == id);
      });
    }

    void _addToDoItem(String toDo) {
      setState(() {
        todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo,
        ));
      });
      _todoController.clear();
    }

    void _runFilter(String enteredKeyword) {
      List<ToDo> results = [];
      if (enteredKeyword.isEmpty) {
        results = todosList;
      } else {
        results = todosList
            .where((item) => item.todoText!
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      }

      setState(() {
        _foundToDo = results;
      });
    }

    Widget searchBox() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          onChanged: (value) => _runFilter(value),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.green.shade400,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.green.shade400),
          ),
        ),
      );
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[900],
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
            "Dashboard ",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 45,
              color: Colors.green.shade50,
            ),
          ),
        ),
      ),
      body: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  right: 10,
                  left: 10,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey.shade900),
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
                                  primary: Colors.blue,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "TASKs",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Colors.black,
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
                                  primary: Colors.blue.shade300,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "PRE Ps",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Colors.black,
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
                                  primary: Colors.green.shade400,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "FITs",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Colors.black,
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
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: screenheight / 7,
                  width: screenWidth,
                  padding: EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                  decoration:
                      BoxDecoration(color: Colors.grey.shade900, boxShadow: [
                    // BoxShadow(
                    //     color: Colors.green.shade400,
                    //     offset: const Offset(0, 5.0),
                    //     blurRadius: 0,
                    //     spreadRadius: 0),
                  ]),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Column(children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "ALERTS",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: Colors.green.shade50,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Container(
                          decoration: new BoxDecoration(
                              color: Colors.green.shade400,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                          height: 10,
                          width: screenWidth / 6,
                          // color: Colors.green.shade400,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: 10),
              //   child: Container(
              //     decoration: new BoxDecoration(
              //         color: Colors.green.shade400,
              //         borderRadius: BorderRadius.all(Radius.circular(100))),
              //     height: 10,
              //     width: screenWidth / 6,
              //     // color: Colors.green.shade400,
              //   ),
              // ),
              // Task alert:
              Padding(
                padding: EdgeInsets.only(top: 0, right: 15, left: 15),
                child: Container(
                  // color: Colors.grey.shade800,
                  height: screenheight / 2.2,
                  width: screenWidth,
                  child: Column(children: [
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            // scrollDirection: Axis.vertical,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 10,
                                  bottom: 20,
                                ),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "TO DO alerts",
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25,
                                      color: Colors.green.shade50,
                                    ),
                                  ),
                                ),
                              ),
                              for (ToDo todoo in _foundToDo.reversed)
                                ToDoItem(
                                  todo: todoo,
                                  onToDoChanged: _handleToDoChange,
                                  onDeleteItem: _deleteToDoItem,
                                ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "pp DO alerts",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: Colors.green.shade50,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              for (ppToDo pptodoo in _foundppToDo.reversed)
                                ppToDoItem(
                                  pptodo: pptodoo,
                                  onToDoChanged: _handleToDoChange,
                                  onDeleteItem: _deleteToDoItem,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
