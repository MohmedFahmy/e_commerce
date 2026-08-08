import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/api_services.dart';
import '../../../core/product_model/product_model.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial());

  final ApiServices _apiServices = ApiServices();
  List<ProductModel> products = [];

  Future<void> getProducts() async {
    emit(GetDataLoading());
    try {
      var productsData = await _apiServices.getData(
        'products_table?select=*,favorite_products(*),purchases_table(*)',
      );
      for (var product in productsData.data as List) {
        products.add(ProductModel.fromJson(product));
      }
      emit(GetDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetDataError());
    }
  }
}
