import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products/products_bloc.dart';
import '../functions/add_to_cart.dart';
import '../models/product_model.dart';
import 'cart_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        double width = MediaQuery.of(context).size.width;
        if (state.isFetching || state.model == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          ProductModel model = state.model!;

          return Scaffold(
              appBar: AppBar(actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => CartScreen()));
                    },
                    icon: Icon(Icons.shopping_cart))
              ]),
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                    // itemCount: state.model!.data!.products!.length,
                    itemCount: 4,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                        // color: Color.fromARGB(255, 173, 170, 170),
                        height: 150,
                        child: Row(
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                  height: 130,
                                  width: width * .25,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 205, 204, 204),
                                      image: DecorationImage(
                                          image: NetworkImage(model.data!
                                              .products![index].prodImage!))),
                                )),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    model.data!.products![index].prodName!,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Lorem Ipsum is simply dummy ",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        "₹ ${model.data!.products![index].prodPrice}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.favorite)),
                                      GestureDetector(
                                        onTap: () {
                                          AddToCart().addtoCart(
                                              model.data!.products![index],
                                              context);
                                        },
                                        child: Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons
                                                    .shopping_cart_rounded)),
                                            const Text("Add to cart")
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ));
        }
      },
    );
  }
}
