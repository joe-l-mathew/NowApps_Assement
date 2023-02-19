part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class GetProducts extends CartEvent {
  final List<Products> list;

  GetProducts({required this.list});
}
