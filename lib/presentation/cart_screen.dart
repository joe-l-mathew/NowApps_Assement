import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart/cart_bloc.dart';
import '../functions/add_to_cart.dart';
import 'widget/cart_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
String dropdownValue = list.first;

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    AddToCart().getAllProducts(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder: ((context, index) {
                    final prod = state.product[index];
                    return ListTile(
                      title: Text(
                        prod.prodName!,
                        style: const TextStyle(fontSize: 12),
                      ),
                      trailing: Text("₹ ${prod.prodPrice}"),
                      subtitle: SizedBox(
                        width: 10,
                        child: Row(
                          children: [
                            Text("Qty: "),
                            DropdownButtonExample(),
                            SizedBox(
                              width: 20,
                            ),
                            IconButton(
                                onPressed: () {
                                  AddToCart()
                                      .deleteProduct(prod.dbId!, context);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                            Spacer()
                          ],
                        ),
                      ),
                    );
                  }),
                  separatorBuilder: ((context, index) => const Divider()),
                  itemCount: state.product.length,
                ),
              ),
              Container(
                color: Colors.red,
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(
                  "CHECKOUT",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              )
            ],
          );
        },
      ),
    );
  }
}
