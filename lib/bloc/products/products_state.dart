part of 'products_bloc.dart';

class ProductsState {
  final bool isFetching;
  final ProductModel? model;
  final bool? isError;
  ProductsState({
    required this.isFetching,
    this.model,
    this.isError,
  });

  ProductsState copyWith({
    bool? isFetching,
    ProductModel? model,
    bool? isError,
  }) {
    return ProductsState(
      isFetching: isFetching ?? this.isFetching,
      model: model ?? this.model,
      isError: isError ?? this.isError,
    );
  }

  @override
  String toString() =>
      'ProductsState(isFetching: $isFetching, model: $model, isError: $isError)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductsState &&
        other.isFetching == isFetching &&
        other.model == model &&
        other.isError == isError;
  }

  @override
  int get hashCode => isFetching.hashCode ^ model.hashCode ^ isError.hashCode;
}

class ProductsInitial extends ProductsState {
  ProductsInitial({required super.isFetching});
}
