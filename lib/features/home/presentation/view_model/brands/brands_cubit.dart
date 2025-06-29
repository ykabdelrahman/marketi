import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/brand_model.dart';
import '../../../data/repos/home_repo.dart';
part 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  final HomeRepo homeRepo;
  BrandsCubit(this.homeRepo) : super(BrandsInitial());

  void getBrands() {
    emit(BrandsLoading());
    homeRepo.getBrands().then((value) {
      value.fold(
        (error) => emit(BrandsError(error.message!)),
        (data) => emit(BrandsLoaded(data)),
      );
    });
  }
}
