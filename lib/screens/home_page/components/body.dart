import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/screens/home_page/components/controller.dart';
import 'package:ecommerce_app/screens/product-details/details.dart';
import 'package:ecommerce_app/screens/seeall_%20screen/seeall.dart';
import 'package:ecommerce_app/widgets/product_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee/marquee.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  MyConstant myConstant = MyConstant();
  ProductController productController = ProductController();
  bool isLike = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Expanded(
          flex: 1,
          child: FutureBuilder<List<Products>>(
            future: productController.getProducts(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Products>> snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              "Popular Products",
                              style: TextStyle(
                                  color: myConstant.kDarkBlueColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "See All",
                                style:
                                    TextStyle(color: myConstant.kDarkBlueColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: myConstant.shoeList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: myConstant.white,
                                height: 200,
                                width: 300,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Image.network(
                                    myConstant.shoeList[index],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              "My Products",
                              style: TextStyle(
                                  color: myConstant.kDarkBlueColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            child: TextButton(
                              onPressed: () {
                                Get.to(()=>const SeeAllScreeen());
                              },
                              child: Text(
                                "See All",
                                style:
                                    TextStyle(color: myConstant.kDarkBlueColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            var data = snapshot.data![index];
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    CategoryCard(
                                      imageUrl: snapshot.data![index].image,
                                      text: "",
                                      height: 150,
                                      width: 150,
                                      press: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetail(
                                                      category: data.category,
                                                      description:
                                                          data.description,
                                                      image: data.image,
                                                      price: data.price,
                                                      count: data.rating.count,
                                                      title: data.title,
                                                      rate: data.rating.rate,
                                                    )));
                                      },
                                    ),
                                    Row(
                                      children: [
                                        Text("\$ ${data.price.toString()}"),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        const Icon(
                                          Icons.star,size: 20,
                                          color: Colors.amber,
                                        ),
                                        Text(data.rating.rate.toString())
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
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
        ),
      ],
    );
  }
}
