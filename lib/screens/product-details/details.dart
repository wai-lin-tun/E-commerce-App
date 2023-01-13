import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/models/myproducts_models.dart';
import 'package:ecommerce_app/service/database/database.dart';
import 'package:ecommerce_app/service/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail(
      {Key? key,
      this.id,
      required this.category,
      required this.description,
      required this.price,
      required this.rate,
      required this.count,
      required this.image,
      required this.title})
      : super(key: key);
  final int? id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final int count;
  final double rate;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  MyConstant myConstant = MyConstant();
  DataBaseHelper dataBaseHelper = DataBaseHelper();
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AllProvider>(context);
    void addCart() {
      dataBaseHelper
          .insertProducts(
        MyProducts(
          title: widget.title,
          productPrice: widget.price.toInt(),
          image: widget.image,
          initialPrice: widget.price.toInt(),
          quantity: ValueNotifier(1),
        ),
      )
          .then((value) {
        provider.addTotalPrice(widget.price.toDouble());
      }).onError((error, stackTrace) {});
    }

    return Scaffold(
      backgroundColor: myConstant.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: myConstant.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 20,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: myConstant.circleColor),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.amber,
                      ),
                      Text(
                        widget.rate.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: myConstant.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    width: 200,
                    child: Image.network(
                      widget.image,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: myConstant.circleColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 20, color: myConstant.kDarkBlueColor),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "\$ ${widget.price}",
                        style: TextStyle(
                            color: myConstant.kDarkBlueColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: myConstant.white,
                        ),
                        child: Center(
                          child: IconButton(
                            highlightColor: myConstant.white,
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SizedBox(
                      child: ReadMoreText(
                        widget.description,
                        trimLines: 2,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        moreStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        lessStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 70,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: myConstant.cursorColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: myConstant.kDarkBlueColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: myConstant.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: myConstant.bluedeep,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: myConstant.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: GestureDetector(
                onTap: () {
                  if (isAdded == false) {
                    addCart();
                  }
                  provider.getCart();
                  isAdded = true;
                },
                child: Center(
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: myConstant.kDarkBlueColor),
                    child: Center(
                      child: isAdded
                          ? Icon(
                              Icons.done,
                              color: myConstant.white,
                              size: 25,
                            )
                          : Text(
                              "Add to Cart",
                              style: TextStyle(
                                  color: myConstant.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
