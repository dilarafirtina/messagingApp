class MenuDisplay {
  int id;
  int pageId;
  DateTime fromDate;
  DateTime toDate;
  DateTime fromTime;
  DateTime toTime;

  MenuDisplay(
      {required this.id,
      required this.pageId,
      required this.fromDate,
      required this.toDate,
      required this.fromTime,
      required this.toTime});

  factory MenuDisplay.fromMap(Map<String, dynamic> json) => MenuDisplay(
      id: json["ID"],
      pageId: json["PAGEID"],
      fromDate: DateTime.parse(json["FROMDATE"]),
      toDate: DateTime.parse(json["TODATE"]),
      fromTime: DateTime.parse(json["FROMTIME"]),
      toTime: DateTime.parse(json["TOTIME"]));
}
