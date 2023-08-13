class ppToDo {
  String? ppid;
  String? pptodoText;
  DateTime? ppDateTime;
  bool ppisDone;

  ppToDo({
    required this.ppid,
    required this.pptodoText,
    this.ppDateTime,
    this.ppisDone = false,
  });

  static List<ppToDo> pptodoList() {
    return [
      ppToDo(ppid: '01', pptodoText: '12334yrgn', ppDateTime: DateTime.now()),
      ppToDo(
        ppid: '02',
        pptodoText: '24235234vb',
      ),
      ppToDo(
        ppid: '03',
        pptodoText: '0wQET800',
      ),
      ppToDo(
        ppid: '04',
        pptodoText: '02394892',
      ),
      ppToDo(
        ppid: '05',
        pptodoText: '134HRJRJHR',
      ),
      ppToDo(
          ppid: '06',
          pptodoText: 'AW23/DROP4/K721',
          ppDateTime: DateTime.now()),
    ];
  }
}
