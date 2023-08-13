import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:nico_tna/tasks/pptodo.dart';
import 'package:nico_tna/tasks/pptodo_item.dart';

// import '../model/todo.dart';
// import '../constants/colors.dart';
// import '../widgets/todo_item.dart';

class bodypp extends StatefulWidget {
  bodypp({Key? key}) : super(key: key);

  @override
  State<bodypp> createState() => _bodyppState();
}

class _bodyppState extends State<bodypp> {
  // refrencing the box
  final _ppMyBox = Hive.box('ppBox');

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
  final pptodosList = ppToDo.pptodoList();
  List<ppToDo> _foundppToDo = [];
  final _pptodoController = TextEditingController();

  @override
  void initState() {
    _foundppToDo = pptodosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
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
                  child: Container(
                    width: screenWidth,
                    color: Colors.grey.shade900,
                    child: Align(
                        alignment: Alignment.center,
                        child: Text('oO  PP Approval  Oo',
                            style: myTextStyleHeading)),
                  ),
                ),
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
                      for (ppToDo pptodoo in _foundppToDo.reversed)
                        ppToDoItem(
                          pptodo: pptodoo,
                          onToDoChanged: _handleppToDoChange,
                          onDeleteItem: _deleteppToDoItem,
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
                    //   controller: _pptodoController,
                    //   decoration: InputDecoration(
                    //       hintText: 'Add a new PP Sample',
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
                      _addToPPbox();
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

  void _addToDoItem(String pptoDo) {
    setState(() {
      pptodosList.add(ppToDo(
        ppid: DateTime.now().millisecondsSinceEpoch.toString(),
        pptodoText: pptoDo,
      ));
    });
    _pptodoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ppToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = pptodosList;
    } else {
      results = pptodosList
          .where((ppitem) => ppitem.pptodoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundppToDo = results;
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
          hintText: 'Search with PP ID',
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

  void _addToPPbox() {
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
              controller: _pptodoController,
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
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'SAVE',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              onPressed: () {
                _addtoPPButtton(_pptodoController.text);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade600,
                minimumSize: Size(20, 30),
                elevation: 0,
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
      pptodosList.add(ppToDo(
        ppid: DateTime.now().millisecondsSinceEpoch.toString(),
        pptodoText: pptoDo,
        ppDateTime: _Eta,
      ));
    });
    _pptodoController.clear();
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
