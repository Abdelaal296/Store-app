part of 'product_cubit_cubit.dart';

@immutable
abstract class ProductCubitStates {}

class ProductCubitInitial extends ProductCubitStates {}

class ProductCubitLoadingState extends ProductCubitStates {}

class ProductCubitSuccessState extends ProductCubitStates {}

class ProductCubitfailureState extends ProductCubitStates {}

class UpdateProductLoadingState extends ProductCubitStates {}

class UpdateProductCubitSuccessState extends ProductCubitStates {}

class AddProductLoadingState extends ProductCubitStates {}

class AddProductCubitSuccessState extends ProductCubitStates {}