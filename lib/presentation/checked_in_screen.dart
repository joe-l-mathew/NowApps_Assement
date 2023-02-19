import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/check_index/check_index_bloc.dart';
import '../bloc/products/products_bloc.dart';
import '../functions/check_in.dart';
import '../models/retailer_model.dart';
import 'home_screen.dart';
import 'products_scree.dart';

class CheckedInScreen extends StatelessWidget {
  final RetailerModel retailer;
  const CheckedInScreen({
    Key? key,
    required this.retailer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(retailer.title),
        elevation: 0,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.read<ProductsBloc>().add(FetchProducts());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => ProductsScreen()));
                },
                child: Text("BOOK ORDER")),
            ElevatedButton(
                onPressed: () async {
                  await CheckInStat().removeCheckin();
                  context.read<CheckIndexBloc>().add(AddNewIndex(index: null));
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (builder) => HomeScreen()),
                      (route) => false);
                },
                child: Text("NO ORDER"))
          ],
        ),
      ),
    );
  }
}
