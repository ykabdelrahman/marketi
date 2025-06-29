part of 'categories_cubit.dart';

@immutable
sealed class BrandsState {}

final class CategoriesInitial extends BrandsState {}

final class CategoriesLoading extends BrandsState {}

final class CategoriesLoaded extends BrandsState {
  final List<CategoryModel> categories;

  CategoriesLoaded(this.categories);
}

final class CategoriesError extends BrandsState {
  final String message;

  CategoriesError(this.message);
}
