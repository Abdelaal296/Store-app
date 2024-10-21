import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/Features/products/data/models/product_model.dart';
import 'package:store_app/Features/products/presentation/view_models/cubit/product_cubit_cubit.dart';
import 'package:store_app/Core/widgets/custom_button.dart';
import 'package:store_app/Core/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController descController = TextEditingController();

  TextEditingController priceController = TextEditingController();


  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
        nameController.text=product.title;
        descController.text=product.description;
        priceController.text=product.price.toString();
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: BlocProvider(
        create: (context) => ProductCubit(),
        child: BlocConsumer<ProductCubit, ProductCubitStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: true,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: const Text(
                  'Update Product',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      CustomTextField(
                          hintText: 'product Name', controller: nameController),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hintText: 'description', controller: descController),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        hintText: 'price',
                        controller: priceController,
                        inputType: TextInputType.number,
                      ), 
                      const SizedBox(
                        height: 50,
                      ),
                      CustomButton(
                        text: 'Update',
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            await ProductCubit.get(context).updateProduct(
                                id: product.id,
                                title: nameController.text ?? product.title,
                                price: priceController.text ??
                                    product.price.toString(),
                                image: product.image,
                                description:
                                    descController.text ?? product.description,
                                category: product.category);
                            ;
                            print('Success');
                          } catch (e) {
                            print(e.toString());
                          }
                          setState(() {
                            isLoading = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
