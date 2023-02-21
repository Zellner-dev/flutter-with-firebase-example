class Product {
  String id;
  String name;
  double price;

  Product({
    required this.id,
    required this.name,
    required this.price
  });

  @override
  String toString() {
    return '''{
      "id" : id,
      "name" name,
      "price" : price
    }''';
  }

  Map<String, dynamic> toJson() {
    return {
      "name" : name,
      "price" : price
    };
  }
}
