class fitToDo {
  String? fitid;
  String? fittodoText;
  bool fitisDone;
  DateTime? fitDateTime;

  fitToDo({
    required this.fitid,
    required this.fittodoText,
    this.fitisDone = false,
    this.fitDateTime,
  });

  static List<fitToDo> fittodoList() {
    return [
      fitToDo(fitid: '01', fittodoText: '1234rtyu', fitisDone: true),
      fitToDo(fitid: '02', fittodoText: 'rwegh5474', fitisDone: true),
      fitToDo(
        fitid: '03',
        fittodoText: '1234rhrtgn',
      ),
      fitToDo(
        fitid: '04',
        fittodoText: 'rnrtnj57858',
      ),
      fitToDo(
        fitid: '05',
        fittodoText: '345tjryrnr',
      ),
      fitToDo(
        fitid: '06',
        fittodoText: '2352g34vbh ',
      ),
    ];
  }
}
