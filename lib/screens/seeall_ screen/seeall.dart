import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/screens/home_page/components/controller.dart';
import 'package:ecommerce_app/screens/product-details/details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SeeAllScreeen extends StatefulWidget {
  const SeeAllScreeen({Key? key}) : super(key: key);

  @override
  State<SeeAllScreeen> createState() => _SeeAllScreeenState();
}

class _SeeAllScreeenState extends State<SeeAllScreeen> {
  MyConstant myConstant = MyConstant();
  ProductController productController = ProductController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myConstant.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          "My Products",
          style: TextStyle(color: myConstant.kDarkBlueColor, fontSize: 25),
        ),
      ),
      body: FutureBuilder<List<Products>>(
        future: productController.getProducts(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Products>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var data = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => ProductDetail(
                          category: data.category,
                          description: data.description,
                          price: data.price,
                          rate: data.rating.rate,
                          count: data.rating.count,
                          image: data.image,
                          title: data.title));
                    },
                    child: Card(
                      elevation: 8,
                      child: Container(
                        height: 160,
                        width: 300,
                        color: myConstant.white,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 100,
                                child: Image.network(
                                  data.image,
                                  width: 100,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    data.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: myConstant.kDarkBlueColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                               
                                  children: [
                                    Text(
                                      "\$ ${data.price}",
                                      style: TextStyle(
                                          color: myConstant.kDarkBlueColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                   const SizedBox(width: 20,),
                                    Container(
                                      height: 35,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: myConstant.circleColor),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              size: 20,
                                              color: Colors.amber,
                                            ),
                                           const SizedBox(width: 10,),
                                            Text(
                                              data.rating.rate.toString(),
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: SizedBox(
              height: 100,
              child: Lottie.asset(myConstant.loadingLottie),
            ),
          );
        },
      ),
    );
  }
}
