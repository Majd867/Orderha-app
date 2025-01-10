import 'dart:ffi';
class ProductInfo{
  String name = '';
  String description = '';
  int price = 0;
  int id = 0;
  String product_photo = '';
  int counter = 0;

  ProductInfo(this.id, this.counter);

  // ProductInfo({
  //   required this.name,
  //   required this.description,
  //   required this.price,
  //   required this.product_photo,
  //   required this.id,
  // });

  //factory ProductInfo.fromJson

  // Map<dynamic, dynamic> toJson()=>(
  // "name" : name,
  // "counter" : counter,
  // );
}