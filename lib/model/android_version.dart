class AndroidVersion {
  int? id;
  String? title;

  AndroidVersion({this.id, this.title});

  factory AndroidVersion.fromJson(Map<String, dynamic> json) {
    return AndroidVersion(id: json['id'], title: json['title']);
  }
}