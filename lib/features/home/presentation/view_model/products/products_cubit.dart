import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product_model.dart';
import '../../../data/repos/home_repo.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final HomeRepo homerepo;
  ProductsCubit(this.homerepo) : super(ProductsInitial());

  void getProducts() {
    emit(ProductsLoading());
    homerepo.getProducts().then((value) {
      value.fold(
        (error) => emit(ProductsError(message: error.message!)),
        (data) => emit(ProductsLoaded(products: data)),
      );
    });
  }
}
