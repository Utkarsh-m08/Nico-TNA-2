import 'package:flutter/material.dart';
import 'package:nico_tna/tasks/pptodo.dart';
import 'package:nico_tna/toDoList/todo.dart';

// import '../model/todo.dart';
// import '../constants/colors.dart';

class ppToDoItem extends StatelessWidget {
  final ppToDo pptodo;
  final onToDoChanged;
  final onDeleteItem;

  const ppToDoItem({
    Key? key,
    required this.pptodo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          // print('Clicked on Todo Item.');
          onToDoChanged(pptodo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.green.shade400,
        leading: Icon(
          pptodo.ppisDone ? Icons.check_box : Icons.local_shipping_outlined,
          color: Colors.grey.shade900,
          size: 35,
        ),
        title: Text(
          'PP ID  :     ' +
              pptodo.pptodoText! +
              '\nETA    :     ' +
              pptodo.ppDateTime.toString(),
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade900,
            // decoration: pptodo.ppisDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red.shade600,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              // print('Clicked on delete icon');
              onDeleteItem(pptodo.ppid);
            },
          ),
        ),
      ),
    );
  }
}
