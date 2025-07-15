part of 'fav_cubit.dart';

@immutable
sealed class FavState {}

final class FavInitial extends FavState {}

final class FavLoading extends FavState {}

final class FavLoaded extends FavState {
  final List<ProductModel> products;

  FavLoaded(this.products);
}

final class FavError extends FavState {
  final String message;

  FavError(this.message);
}

final class AddedToFav extends FavState {
  final String message;

  AddedToFav(this.message);
}

final class RemovedFromFav extends FavState {
  final String message;

  RemovedFromFav(this.message);
}
