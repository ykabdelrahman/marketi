part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<ProductModel> products;

  CartLoaded(this.products);
}

final class CartError extends CartState {
  final String message;

  CartError(this.message);
}

final class AddedToCart extends CartState {
  final String message;

  AddedToCart(this.message);
}

final class RemovedFromCart extends CartState {
  final String message;

  RemovedFromCart(this.message);
}
