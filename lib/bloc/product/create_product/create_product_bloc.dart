import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_e_catalog/data/datasources/product_datasoureces.dart';
import 'package:flutter_e_catalog/data/models/request/product_request_model.dart';
import 'package:flutter_e_catalog/data/models/response/product_response_model.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  ProductDatasources productDatasources;
  CreateProductBloc(
    this.productDatasources,
  ) : super(CreateProductInitial()) {
    on<DoCreateProductEvent>((event, emit) async {
      emit(CreateProductLoading());
      final result =
          await productDatasources.createProduct(event.productRequestModel);
      emit(CreateProductLoaded(productResponseModel: result));
    });
  }
}
