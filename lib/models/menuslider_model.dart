class MenuSlider {
  int order;
  String? title;
  String? subtitle;
  String? route;
  String imageUrl;

  MenuSlider({
    required this.order,
    this.title,
    this.subtitle,
    this.route,
    required this.imageUrl,
  });

  factory MenuSlider.fromMap(Map<String, dynamic> json) => MenuSlider(
      order: 1,
      title: json["TITLE"],
      subtitle: json["SUBTITLE"],
      route: json["ROUTE"],
      imageUrl: json["TYPEID"]);
}
