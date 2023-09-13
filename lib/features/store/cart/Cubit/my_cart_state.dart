part of 'my_cart_cubit.dart';

@immutable
class MyCartState {
  List<ProductCart> productsCart;

  MyCartState({required this.productsCart});
}

class ProductCart {
  ProductCart(
      {required this.id,
      required this.category,
      required this.image,
      required this.price,
      required this.counter,
      required this.title});

  @override
  String toString() {
    return 'ProductCart{id: $id, category: $category,title:$title, image: $image, price: $price, counter: $counter}';
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "quantity": counter,
    };
  }

  final int? id;
  final String? category;
  final String? title;
  final String? image;
  final double? price;
  final int? counter;
}
