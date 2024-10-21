import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/Features/categories/presentation/view-models/cubit/categories_cubit.dart';
import 'package:store_app/Features/products/presentation/views/widgets/custom_card.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String name;
  const CategoryProductsScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getCategoriesProduct(categoryName: name),
      child: BlocConsumer<CategoriesCubit,CategoriesStates>(
          listener: (context, state) {},
          builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(name),
                  centerTitle: true,
                ),
                body: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
                  child: GridView.builder(
                    itemCount: CategoriesCubit.get(context).products.length,
                    clipBehavior: Clip.none,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 100),
                    itemBuilder: (context, index) => CustomCard(product: CategoriesCubit.get(context).products[index],),
                  ),
                ),
              );
            } ,
      )
    );
  }
}