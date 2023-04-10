class GorkhaPatra {
  String? image;
  String? date;
  String? title;
  String? link;
  String? description;

  GorkhaPatra({this.image, this.date, this.title, this.link, this.description});

  GorkhaPatra.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    date = json['date'];
    title = json['title'];
    link = json['link'];
    description= json['descripton'];
  }
}
