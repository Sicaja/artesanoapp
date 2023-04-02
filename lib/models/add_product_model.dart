class AddProductModel {
  String? title;
  String? description;
  int? price;
  int? discountPercent;
  int? stock;
  String? category;

  AddProductModel(
      {this.title,
      this.description,
      this.price,
      this.discountPercent,
      this.stock,
      this.category});

  AddProductModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercent = json['discountPercent'];
    stock = json['stock'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['discountPercent'] = discountPercent;
    data['stock'] = stock;
    data['category'] = category;
    return data;
  }
}
