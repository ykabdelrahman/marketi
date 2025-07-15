import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/data/models/product_model.dart';
import '../../../data/repos/fav_repo.dart';
part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  final FavRepo _favRepo;
  FavCubit(this._favRepo) : super(FavInitial());

  Future<void> getFav() async {
    emit(FavLoading());
    final result = await _favRepo.getFav();
    result.fold(
      (error) => emit(FavError(error.message!)),
      (products) => emit(FavLoaded(products)),
    );
  }

  Future<void> addFav(String productId) async {
    final result = await _favRepo.addFav(productId: productId);
    result.fold(
      (error) => emit(FavError(error.message!)),
      (message) => emit(AddedToFav(message)),
    );
  }

  Future<void> removeFav(String productId) async {
    final result = await _favRepo.removeFav(productId: productId);
    result.fold(
      (error) => emit(FavError(error.message!)),
      (message) => emit(RemovedFromFav(message)),
    );
  }
}
