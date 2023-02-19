import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/product_model.dart';
import '../../repository/get_products.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial(isFetching: false)) {
    on<FetchProducts>((event, emit) async {
      emit(state.copyWith(isFetching: true));
      // TODO: implement event handler
      var model = await GetProducts().fetchApi();
      if (model == null) {
        emit(state.copyWith(isError: true));
      } else {
        emit(state.copyWith(model: model, isFetching: false));
      }
    });
  }
}
