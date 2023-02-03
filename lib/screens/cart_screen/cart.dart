import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/cart_screen/cart_empty.dart';
import 'package:ecommerce_app/service/database/database.dart';
import 'package:ecommerce_app/service/provider/provider.dart';
import 'package:ecommerce_app/widgets/cart_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  MyConstant myConstant = MyConstant();
  DataBaseHelper dataBaseHelper = DataBaseHelper();
  @override
  void initState() {
    context.read<AllProvider>().getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     final appLocalization =  AppLocalizations.of(context);
    final provider = Provider.of<AllProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myConstant.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
         appLocalization!.yourCart,
          style: TextStyle(color: myConstant.kDarkBlueColor, fontSize: 25),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Consumer<AllProvider>(
              builder: (context, value, child) {
                if (provider.productList.isEmpty) {
                  return const EmptyCart();
                }
                return ListView.builder(
                  itemCount: value.productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = value.productList[index];
                    return CartContainer(
                        id: data.id!.toInt(),
                        price: data.initialPrice!.toInt(),
                        quantity: data.quantity!,
                        title: data.title,
                        image: data.image);
                  },
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Consumer<AllProvider>(
              builder: (context, value, child) {
                final ValueNotifier<int?> totalPrice = ValueNotifier(null);
                for (var element in value.productList) {
                  totalPrice.value =
                      (element.productPrice! * element.quantity!.value) +
                          (totalPrice.value ?? 0);
                }
                return Container(
                  color: myConstant.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            appLocalization.totalPrice,
                            style: TextStyle(
                                color: myConstant.kDarkBlueColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          ValueListenableBuilder<int?>(
                            valueListenable: totalPrice,
                            builder: (context, val, child) {
                              return Text(
                                "\$${val?.toStringAsFixed(2) ?? "0"}",
                                style: TextStyle(
                                    color: myConstant.kDarkBlueColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: myConstant.kDarkBlueColor),
                        child: Center(
                          child: Text(
                            appLocalization.order,
                            style: TextStyle(
                                color: myConstant.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
