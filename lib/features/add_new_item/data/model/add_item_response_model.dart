class AddItemResponseModel {
  final int id;
  final String name;
  final String imageUrl;

  AddItemResponseModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory AddItemResponseModel.fromJson(Map<String, dynamic> json) {
    return AddItemResponseModel(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['picture'] as String,
    );
  }
}
