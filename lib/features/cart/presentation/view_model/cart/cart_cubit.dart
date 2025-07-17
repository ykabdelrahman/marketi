import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/data/models/product_model.dart';
import '../../../data/repos/cart_repo.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;
  CartCubit(this._cartRepo) : super(CartInitial());

  Future<void> getCart() async {
    emit(CartLoading());
    final result = await _cartRepo.getCart();
    result.fold(
      (error) => emit(CartError(error.message!)),
      (products) => emit(CartLoaded(products)),
    );
  }

  Future<void> addCart(ProductModel product) async {
    final result = await _cartRepo.addCart(product: product);
    result.fold(
      (error) {
        emit(CartError(error.message!));
        getCart();
      },
      (message) {
        emit(AddedToCart(message));
        getCart();
      },
    );
  }

  Future<void> removeCart(String productId) async {
    final result = await _cartRepo.removeCart(productId: productId);
    result.fold(
      (error) {
        emit(CartError(error.message!));
        getCart();
      },
      (message) {
        emit(RemovedFromCart(message));
        getCart();
      },
    );
  }
}
