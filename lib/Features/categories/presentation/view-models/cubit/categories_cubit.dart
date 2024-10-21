import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/Features/products/data/models/product_model.dart';
import 'package:store_app/Core/helper/api.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitial());
  static CategoriesCubit get(context)=>BlocProvider.of(context);
  List<dynamic> categories=[];
  Future getAllCategories() async {
    emit(CategoriesLoadingState());
    categories = await Api().get(url: 'https://fakestoreapi.com/products/categories',token: null);
    emit(CategoriesSuccessstate());
  }

  List<ProductModel> products=[];

  Future getCategoriesProduct({required String categoryName}) async {
    emit(CategoryProductsLoadingState());
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName',token: null);
    products = [];
    for (var product in data) {
      products.add(ProductModel.fromJson(product));
    }
    emit(CategoryProductsSuccessstate());
  }

}
