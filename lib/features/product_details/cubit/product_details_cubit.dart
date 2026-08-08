import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/api_services.dart';
import '../model/rate_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
  final ApiServices _apiService = ApiServices();
  List<Rate> rates = [];
  int averageRate = 0;

  Future<void> getProductRate({required String productId}) async {
    emit(GetProductRateLoading());
    try {
      var rateData = await _apiService.getData(
        'rates_table?select=*&for_product=eq.$productId',
      );
      for (var rate in rateData.data as List) {
        rates.add(Rate.fromJson(rate));
      }
      emit(GetProductRateSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetProductRateError());
    }
  }
}
