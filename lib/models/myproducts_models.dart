import 'package:flutter/material.dart';

class MyProducts {
  late final int? id;
  final String title;
  final int? initialPrice;
  final int? productPrice;
  final String image;
  final ValueNotifier<int>? quantity;
    MyProducts({
       this.id,
      required this.title,
      required this.initialPrice,
      required this.image,
      required this.productPrice,
      required this.quantity
    }
    );
    MyProducts.fromMap(Map<dynamic,dynamic> myProducts)
   : id    =myProducts["id"],
     title =myProducts["title"],
     initialPrice =myProducts["initialPrice"],
     image = myProducts["image"],
     productPrice = myProducts ["productPrice"],
      quantity =ValueNotifier(myProducts["quantity"]);
  
   Map <String,dynamic> toMap(){
    return {
     "id" : id,
     "title" : title,
     "initialPrice" : initialPrice,
     "image" : image,
     "productPrice":productPrice,
     "quantity" : quantity?.value,
    };
   }
     Map<String, dynamic> quantityMap() {
    return {
      'id': id,
      'quantity': quantity!.value,
    };
  }
}