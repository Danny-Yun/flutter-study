class EventModel {
  int? idx;
  String? url;
  String? displayType;
  String? type;

  EventModel({
    required this.idx,
    required this.url,
    required this.displayType,
    required this.type,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      idx: json["idx"] as int?,
      url: json["url"] as String?,
      displayType: json["displayType"] as String?,
      type: json["type"] as String?,
    );
  }
}
