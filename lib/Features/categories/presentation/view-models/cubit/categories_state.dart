part of 'categories_cubit.dart';

@immutable
abstract class CategoriesStates {}

class CategoriesInitial extends CategoriesStates {}

class CategoriesLoadingState extends CategoriesStates {}

class CategoriesSuccessstate extends CategoriesStates {}

class CategoriesFailureState extends CategoriesStates {}

class CategoryProductsLoadingState extends CategoriesStates {}

class CategoryProductsSuccessstate extends CategoriesStates {}
