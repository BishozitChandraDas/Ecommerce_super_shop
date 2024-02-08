import 'dart:async';
import 'package:super_shop_ecommerce/app/data/db_helper/cart_model.dart';
import 'package:super_shop_ecommerce/app/model/product_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "cart.db");
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE cart (
            id TEXT PRIMARY KEY,
            quantity INTEGER,
            name TEXT,
            description TEXT,
            price TEXT,
            weight TEXT,
            image TEXT
          )
        ''');
  }

  ///add to cart
  Future<void> addToCart({required ProductModel product}) async {
    var database = await db;
    final existingItem = await database!.query(
      'cart',
      where: 'id = ?',
      whereArgs: [product.id],
    );

    if (existingItem.isEmpty) {
      await database.insert(
        'cart',
        CartModel(
          id: product.id,
          quantity: product.quantity,
          name: product.name,
          description: product.description,
          price: product.price,
          weight: product.weight,
          image: product.image,
        ).toMap(),
      );
      print("add to cart");
    } else {
      await increaseQuantity(id: product.id!);
    }
  }

  ///increase quantity
  Future<void> increaseQuantity({required String id}) async {
    var database = await db;
    await database!.rawUpdate(
      'UPDATE cart SET quantity = quantity + 1 WHERE id = ?',
      [id],
    );
  }

  Future<void> decreaseQuantity({required String id}) async {
    var database = await db;
    await database!.transaction((txn) async {
      var row = await txn.query(
        'cart',
        where: 'id = ?',
        whereArgs: [id],
      );

      if (row.isNotEmpty) {
        if (int.parse(row[0]['quantity'].toString()) > 1) {
          await txn.rawUpdate(
            'UPDATE cart SET quantity = quantity - 1 WHERE id = ?',
            [id],
          );
        } else {
          await deleteCartItem(id: id);
        }
      }
    });
  }

  Future<void> deleteCartItem({required String id}) async {
    var database = await db;
    await database!.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> quantity({required String id}) async {
    var database = await db;
    var result = 0;
    var rows = await database!.query(
      'cart',
      columns: ['quantity'],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (rows.isNotEmpty) {
      result = int.parse(rows[0]['quantity'].toString());
    }

    return result;
  }

  Future<double> calculateSubtotal() async {
    var database = await db;
    var result = 0.0;
    var rows = await database!.query('cart');

    for (var row in rows) {
      result += double.parse(row['price'].toString()) *
          int.parse(row['quantity'].toString());
    }

    return result;
  }
}
