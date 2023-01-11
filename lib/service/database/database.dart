import 'package:ecommerce_app/models/myproducts_models.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  String productTable = "productTable";
  String colId = "id";
  String colTitle = "title";
  String colInitialPrice = "initialPrice";
  String colProductPrice = "productPrice";
  String colQuantity = "quantity";
  String colImage = "image";
  Future<Database> initializeDB()async{
    String path = await getDatabasesPath();
    return openDatabase(("${path}product.db"), onCreate: (db, version){
      db.execute(
        "CREATE TABLE $productTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT NOT NULL, $colImage TEXT NOT NULL, $colInitialPrice INTEGER NOT NULL, $colProductPrice INTEGER NOT NULL, $colQuantity NTEGER NOT NULL )"
      );
    },version: 1);
  }

 Future<int> insertProducts(MyProducts myProducts) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert(productTable, myProducts.toMap());
   
    return result;
  }

Future<List<MyProducts>> retrieveProducts() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query(productTable);
    return queryResult.map((e) => MyProducts.fromMap(e)).toList();
  }
Future<void> deleteCart(int id) async {
    final Database db = await initializeDB();
    await db.delete(
      productTable,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> updateData(MyProducts myProducts) async {
    final db = await initializeDB();
    var result = await db.update(productTable, myProducts.quantityMap(),
        where: '$colId = ?', whereArgs: [myProducts.id]);
    return result;
  }
}