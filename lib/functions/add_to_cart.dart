import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../bloc/cart/cart_bloc.dart';
import '../models/product_model.dart';

late Database db;

class AddToCart {
  static const String cartDbName = 'cart';

  Future<void> initDb() async {
    db = await openDatabase(
      cartDbName,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE $cartDbName (id INTEGER PRIMARY KEY, name TEXT, prodPrice TEXT, prodImage TEXT, prodId TEXT)');
        db = db;
      },
    );
  }

  void addtoCart(Products product, BuildContext context) async {
    bool doesExist = false;
    List<Map> list = await db.rawQuery('SELECT * FROM $cartDbName');
    getAllProducts(context);
    list.forEach((element) {
      if (product.prodId == element['prodId']) {
        doesExist = true;
      }
    });
    if (!doesExist) {
      db.rawInsert(
          'INSERT INTO $cartDbName(name, prodPrice, prodImage,prodId) VALUES(?, ?, ?,?)',
          [
            product.prodName,
            product.prodPrice,
            product.prodImage,
            product.prodId
          ]);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Product already exist in cart")));
    }
  }

  Future<void> deleteProduct(int id, BuildContext context) async {
    await db.rawDelete('DELETE FROM $cartDbName WHERE id = ?', [id]);
    getAllProducts(context);
  }

  Future<void> getAllProducts(BuildContext context) async {
    List<Map> list = await db.rawQuery('SELECT * FROM $cartDbName');

    List<Products> productModelList = [];
    list.forEach((element) {
      productModelList.add(Products(
          dbId: element['id'],
          prodName: element['name'],
          prodPrice: element['prodPrice'],
          prodImage: element['prodImage'],
          prodId: element['prodId']));
    });
    context.read<CartBloc>().add(GetProducts(list: productModelList));
  }
}
