import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/Features/products/data/models/product_model.dart';
import 'package:store_app/Core/helper/api.dart';

part 'product_cubit_state.dart';

class ProductCubit extends Cubit<ProductCubitStates> {
  ProductCubit() : super(ProductCubitInitial());
  static ProductCubit get(context)=> BlocProvider.of(context);

  List<ProductModel> products=[];

  Future getAllProduct() async {
    emit(ProductCubitLoadingState());
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products',token: null);

    for (var product in data) {
      products.add(ProductModel.fromJson(product));
    }
    emit(ProductCubitSuccessState());
  }

  Future updateProduct({
    required int id,
    required String title,
    required String price,
    required String image,
    required String description,
    required String category,
  }) async {
    emit(UpdateProductLoadingState());
    Map<String, dynamic> data = await Api().put(
        url: 'https://fakestoreapi.com/products/$id',
        body: {
          'title': title,
          'price': price,
          'description': description,
          'image': image,
          'category': category,
        },
        token: null);
        emit(UpdateProductCubitSuccessState());
  }

  Future addProduct({
    required String title,
    required String price,
    required String image,
    required String description,
    required String category,
  })async{
    emit(AddProductLoadingState());
   Map<String,dynamic> data = await Api().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    },token: null);
    emit(AddProductCubitSuccessState());
  }
}
