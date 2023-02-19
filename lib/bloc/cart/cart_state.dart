part of 'cart_bloc.dart';

class CartState {
  final List<Products> product;
  CartState({
    required this.product,
  });

  CartState copyWith({
    List<Products>? product,
  }) {
    return CartState(
      product: product ?? this.product,
    );
  }
}

class CartInitial extends CartState {
  CartInitial({required super.product});
}
