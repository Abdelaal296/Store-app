import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/Features/categories/presentation/view-models/cubit/categories_cubit.dart';
import 'package:store_app/Features/categories/presentation/views/widgets/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
      create: (context) => CategoriesCubit()..getAllCategories(),
      child: BlocConsumer<CategoriesCubit,CategoriesStates>(
          listener: (context, state) {},
          builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
                child: GridView.builder(
                  itemCount: CategoriesCubit.get(context).categories.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 100),
                  itemBuilder: (context, index) => CategoryCard(title: CategoriesCubit.get(context).categories[index]),
                ),
              );
            } ,
      )
    );
  }
}