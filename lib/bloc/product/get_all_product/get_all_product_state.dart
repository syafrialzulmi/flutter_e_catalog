part of 'get_all_product_bloc.dart';

@immutable
abstract class GetAllProductState {}

final class GetAllProductInitial extends GetAllProductState {}

final class GetAllProductLoading extends GetAllProductState {}

final class GetAllProductLoaded extends GetAllProductState {
  final List<ProductResponseModel> listProduct;

  GetAllProductLoaded({
    required this.listProduct,
  });
}
