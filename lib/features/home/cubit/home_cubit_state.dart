part of 'home_cubit_cubit.dart';

@immutable
sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class GetDataLoading extends HomeCubitState {}

final class GetDataSuccess extends HomeCubitState {
  // final List<ProductModel> data;
  // GetDataSuccess(this.data);
}

final class GetDataError extends HomeCubitState {}
