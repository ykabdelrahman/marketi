part of 'brands_cubit.dart';

@immutable
sealed class BrandsState {}

final class BrandsInitial extends BrandsState {}

final class BrandsLoading extends BrandsState {}

final class BrandsLoaded extends BrandsState {
  final List<BrandModel> brands;

  BrandsLoaded(this.brands);
}

final class BrandsError extends BrandsState {
  final String message;

  BrandsError(this.message);
}
