class MenuItem {
  final String name;
  final List<String> ingredients;

  MenuItem({required this.name, required this.ingredients});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      name: json["name"] ?? "",
      ingredients: List<String>.from(json["ingredients"] ?? []),
    );
  }
}
