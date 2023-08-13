import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nico_tna/tasks/fittodo.dart';
import 'package:nico_tna/tasks/fittodo_item.dart';

// import '../model/todo.dart';
// import '../constants/colors.dart';
// import '../widgets/todo_item.dart';

class bodyfit extends StatefulWidget {
  bodyfit({Key? key}) : super(key: key);

  @override
  State<bodyfit> createState() => _bodyfitState();
}

class _bodyfitState extends State<bodyfit> {
  DateTime _Eta = DateTime.now();
  final myTextStyleHeading = GoogleFonts.montserrat(
    // fontWeight: FontWeight.bold,
    fontSize: 25,
    color: Colors.grey.shade600,
  );
  final myTextStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.bold,
    fontSize: 40,
    color: Colors.green.shade400,
  );
  final fittodosList = fitToDo.fittodoList();
  List<fitToDo> _foundfitToDo = [];
  final _fittodoController = TextEditingController();

  @override
  void initState() {
    _foundfitToDo = fittodosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      // appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text('oO  FIT Approval  Oo',
                        style: myTextStyleHeading)),
                searchBox(),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        // child: Text('PP Approval', style: myTextStyleHeading),
                      ),
                      for (fitToDo fittodoo in _foundfitToDo.reversed)
                        fitToDoItem(
                          fittodo: fittodoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                    // margin: EdgeInsets.only(
                    //   bottom: 20,
                    //   right: 20,
                    //   left: 20,
                    // ),
                    // padding: EdgeInsets.symmetric(
                    //   horizontal: 20,
                    //   vertical: 5,
                    // ),
                    // decoration: BoxDecoration(
                    //   color: Colors.grey.shade600,
                    //   boxShadow: const [
                    //     // BoxShadow(
                    //     //   color: Colors.grey,
                    //     //   offset: Offset(0.0, 0.0),
                    //     //   blurRadius: 10.0,
                    //     //   spreadRadius: 0.0,
                    //     // ),
                    //   ],
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    // child: TextField(
                    //   controller: _fittodoController,
                    //   decoration: InputDecoration(
                    //       hintText: 'Add a new todo item',
                    //       border: InputBorder.none),
                    // ),
                    ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    onPressed: () {
                      _addToFitbox();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.blue.shade300,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(fitToDo fittodo) {
    setState(() {
      fittodo.fitisDone = !fittodo.fitisDone;
    });
  }

  void _deleteToDoItem(String fitid) {
    setState(() {
      fittodosList.removeWhere((item) => item.fitid == fitid);
    });
  }

  void _addToDoItem(String fittoDo) {
    setState(() {
      fittodosList.add(fitToDo(
        fitid: DateTime.now().millisecondsSinceEpoch.toString(),
        fittodoText: fittoDo,
      ));
    });
    _fittodoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<fitToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = fittodosList;
    } else {
      results = fittodosList
          .where((item) => item.fittodoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundfitToDo = results;
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

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.amber,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(
          Icons.menu,
          color: Colors.amber,
          size: 30,
        ),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            // child: Image.asset('assets/images/avatar.jpeg'),
          ),
        ),
      ]),
    );
  }

  void _addToFitbox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade600,
        title: Text(
          "ADD new Pre Production ID",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.green.shade50,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // pp id
            TextField(
              controller: _fittodoController,
            ),
            SizedBox(
              height: 50,
            ),
            // // comment
            // TextField(),
            // date picker
            MaterialButton(
              color: Colors.green.shade400,
              elevation: 10,
              onPressed: () {
                _ppshowEtaPicker();
              },
              child: Text(
                "Choose ETA",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.green.shade50,
                ),
              ),
            ),

            // save button
            ElevatedButton(
              child: Text(
                'SAVE',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                _addtoPPButtton(_fittodoController.text);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green.shade400,
                minimumSize: Size(20, 30),
                elevation: 10,
              ),
            )
          ],
        ),
      ),
    );
  }

  // save button function
  void _addtoPPButtton(String pptoDo) {
    setState(() {
      fittodosList.add(fitToDo(
        fitid: DateTime.now().millisecondsSinceEpoch.toString(),
        fittodoText: pptoDo,
        fitDateTime: _Eta,
      ));
    });
    _fittodoController.clear();
  }

// picking eta

  void _ppshowEtaPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    ).then((value) {
      setState(() {
        _Eta = value!;
      });
    });
  }
}
