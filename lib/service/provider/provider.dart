import 'package:ecommerce_app/models/myproducts_models.dart';
import 'package:ecommerce_app/service/database/database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllProvider with ChangeNotifier {
  bool isLoading = true;
  int currentIndex = 0;
  bool loginpasswordVisible = true;
  bool signupPasswordVisible = true;
  DataBaseHelper dataBaseHelper = DataBaseHelper();
  List<MyProducts> productList = [];
  int quantity = 1;
  double totalPrice = 0.0;
    
   loginVisible(){
  loginpasswordVisible = !loginpasswordVisible;
  notifyListeners();
   }
   signupVisible(){
    signupPasswordVisible = !signupPasswordVisible;
    notifyListeners();
   }

  onTapItem(index) {
    currentIndex = index;
    notifyListeners();
  }

  void setPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoading", true);
    prefs.setInt('item_quantity', quantity);
    prefs.setDouble('total_price', totalPrice);
    notifyListeners();
  }

  void getPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading = prefs.getBool("isLoading") ?? false;
    quantity = prefs.getInt('item_quantity') ?? 1;
    totalPrice = prefs.getDouble('total_price') ?? 0;
    notifyListeners();
  }

  void removeItem(int id) {
    dataBaseHelper.deleteCart(id);
    final index = productList.indexWhere((element) => element.id == id);
    productList.removeAt(index);
    notifyListeners();
  }

  getCart() async {
    productList = await dataBaseHelper.retrieveProducts();
    notifyListeners();
    return productList;
  }

  void addQuantity(int id) {
    final index = productList.indexWhere((element) => element.id == id);
    productList[index].quantity!.value = productList[index].quantity!.value + 1;
    setPrefsItems();
    notifyListeners();
  }

  void deleteQuantity(int id) {
    final index = productList.indexWhere((element) => element.id == id);
    final currentQuantity = productList[index].quantity!.value;
    if (currentQuantity <= 1) {
      currentQuantity == 1;
    } else {
      productList[index].quantity!.value = currentQuantity - 1;
    }
    setPrefsItems();
    notifyListeners();
  }

  void addTotalPrice(double productPrice) {
    totalPrice = totalPrice + productPrice;
    setPrefsItems();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    totalPrice = totalPrice - productPrice;
    setPrefsItems();
    notifyListeners();
  }
}
