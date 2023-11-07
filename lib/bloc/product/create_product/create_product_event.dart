part of 'create_product_bloc.dart';

@immutable
abstract class CreateProductEvent {}

class DoCreateProductEvent extends CreateProductEvent {
  final ProductRequestModel productRequestModel;
  DoCreateProductEvent({
    required this.productRequestModel,
  });
}
