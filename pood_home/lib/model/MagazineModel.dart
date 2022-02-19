class MagazineModel {
  int? idx;
  String? url;

  MagazineModel({required this.idx, required this.url});

  @override
  String toString() {
    return "MagazineModel(idx: $idx, url: $url)\n";
  }

  factory MagazineModel.fromJson(Map<String, dynamic> json) {
    return MagazineModel(
      idx: json["idx"] as int,
      url: json["url"] as String,
    );
  }
}
