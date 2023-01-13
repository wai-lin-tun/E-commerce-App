import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/models/myproducts_models.dart';
import 'package:ecommerce_app/service/database/database.dart';
import 'package:ecommerce_app/service/provider/provider.dart';
import 'package:ecommerce_app/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartContainer extends StatelessWidget {
  const CartContainer(
      {Key? key,
      required this.price,
      required this.image,
      required this.id,
      required this.title,
      required this.quantity})
      : super(key: key);
  final String image;
  final String title;
  final int price;
  final int id;
  final ValueNotifier<int> quantity;

  @override
  Widget build(BuildContext context) {
    MyConstant myConstant = MyConstant();
    DataBaseHelper dataBaseHelper = DataBaseHelper();
    final provider = Provider.of<AllProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        elevation: 4,
        child: Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: myConstant.white,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 100,
                  width: 120,
                  child: Image.network(image),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: myConstant.kDarkBlueColor,
                        fontSize: 17,
                      ),
                    ),
                    ValueListenableBuilder<int>(
                        valueListenable: quantity,
                        builder: (context, val, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  provider.addQuantity(id);
                                  dataBaseHelper
                                      .updateData(
                                    MyProducts(
                                      id: id,
                                      title: title,
                                      initialPrice: price,
                                      image: image,
                                      productPrice: price,
                                      quantity: ValueNotifier(quantity.value),
                                    ),
                                  )
                                      .then((value) {
                                    provider.addTotalPrice(
                                      double.parse(
                                        price.toString(),
                                      ),
                                    );
                                  });
                                },
                                child: Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: myConstant.circleColor),
                                  child: const Center(
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ),
                              Container(
                                height: 35,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: myConstant.circleColor),
                                child: Center(
                                  child: Text(val.toString()),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  provider.deleteQuantity(id);
                                  dataBaseHelper
                                      .updateData(
                                    MyProducts(
                                      id: id,
                                      title: title,
                                      initialPrice: price,
                                      image: image,
                                      productPrice: price,
                                      
                                      quantity: ValueNotifier(quantity.value),
                                    ),
                                  )
                                      .then((value) {
                                    provider.removeTotalPrice(
                                      double.parse(
                                        price.toString(),
                                      ),
                                    );
                                  });
                                },
                                child: Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: myConstant.circleColor),
                                  child: const Center(
                                    child: Icon(Icons.remove),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "\$ $price",
                          style: TextStyle(
                              color: myConstant.kDarkBlueColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return MyDialog(
                                  title: "Delete!",
                                  cancel: () {
                                    Navigator.pop(context);
                                  },
                                  content: "Are you sure?",
                                  comfirm: () {
                                    provider.removeItem(id);
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            );
                          },
                          child: Container(
                            alignment: Alignment.bottomRight,
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: myConstant.kDarkBlueColor),
                            child: Center(
                              child: Text(
                                "Remove",
                                style: TextStyle(
                                  color: myConstant.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
