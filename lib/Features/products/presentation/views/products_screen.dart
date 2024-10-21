import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/Features/products/presentation/view_models/cubit/product_cubit_cubit.dart';
import 'package:store_app/Features/products/presentation/views/widgets/custom_card.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getAllProduct(),
      child: BlocConsumer<ProductCubit,ProductCubitStates>(
          listener: (context, state) {},
          builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
                child: GridView.builder(
                  itemCount: ProductCubit.get(context).products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 100),
                  itemBuilder: (context, index) => CustomCard(product: ProductCubit.get(context).products[index],),
                ),
              );
            } ,
      )
    );
  }
}
