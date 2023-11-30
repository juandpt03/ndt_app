class Content {
  final String title;
  final String description;
  final String image;
  final Map<String, dynamic>? information;
  final List? images;

  Content({
    this.images,
    this.information,
    required this.title,
    required this.description,
    required this.image,
  });
  toJson() => {
        'title': title,
        'description': description,
        'image': image,
      };
}
