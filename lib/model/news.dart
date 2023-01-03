class News{

  String title;
  String description;
  String image;

  News({required this.title, required this.description, required this.image});

  News.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        description = json["description"],
        image = json['image'];

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'image': image
  };
}