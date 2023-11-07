import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_e_catalog/data/datasources/product_datasoureces.dart';

import 'package:flutter_e_catalog/data/models/response/product_response_model.dart';

part 'get_all_product_event.dart';
part 'get_all_product_state.dart';

class GetAllProductBloc extends Bloc<GetAllProductEvent, GetAllProductState> {
  final ProductDatasources productDatasources;
  GetAllProductBloc(
    this.productDatasources,
  ) : super(GetAllProductInitial()) {
    on<DoGetAllProductEvent>((event, emit) async {
      emit(GetAllProductLoading());
      final result = await productDatasources.getProductAll();
      emit(GetAllProductLoaded(listProduct: result));
    });
  }
}
