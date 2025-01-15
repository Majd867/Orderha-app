class SearchResult {
  final int id;
  final String name;
  final String description;
  final int price;
  final int store_id;
  final String imageUrl;
  final String type;

  SearchResult({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.price,
    required this.store_id,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      id: json['id'] ?? 0,
      name: json['name'],
      store_id: json['store_id'] ?? 0,
      price :json['price'] ?? 0,
      description: json['description'],
      imageUrl: json['image_url'] ??"https://images.pexels.com/photos/1860208/pexels-photo-1860208.jpeg?cs=srgb&dl=cooked-food-1860208.jpg&fm=jpg",
      type: json['type'] ?? "",
    );
  }
}
