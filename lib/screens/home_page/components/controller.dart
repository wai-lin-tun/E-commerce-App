import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductController {
  MyConstant myConstant = MyConstant();
  Future <List<Products>> getProducts() async {
    var url = Uri.parse(myConstant.productUrl);
    var response = await http.get(url);
    if(response.statusCode == 200){
      
      return productsFromJson(response.body);
    }
    return throw Exception();
  }
}