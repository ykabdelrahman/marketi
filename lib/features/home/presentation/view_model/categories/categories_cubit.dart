import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/category_mode.dart';
import '../../../data/repos/home_repo.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeRepo homerepo;
  CategoriesCubit(this.homerepo) : super(CategoriesInitial());

  void getCategories() {
    emit(CategoriesLoading());
    homerepo.getCategories().then((value) {
      value.fold(
        (error) => emit(CategoriesError(error.message!)),
        (data) => emit(CategoriesLoaded(data)),
      );
    });
  }
}
