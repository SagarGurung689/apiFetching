class News {
  String? image;
  String? date;
  String? title;
  String? link;
  String? description;

  News({this.image, this.date, this.title, this.link, this.description});

  News.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    date =json['date'];
    title = json['title'];
    link = json['link'];
    description = json['description'];


  }
}
