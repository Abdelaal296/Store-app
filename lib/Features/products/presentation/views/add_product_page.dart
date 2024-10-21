import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/Features/products/presentation/view_models/cubit/product_cubit_cubit.dart';
import 'package:store_app/Core/widgets/custom_button.dart';
import 'package:store_app/Core/widgets/custom_text_field.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController descController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController imageController = TextEditingController();

  TextEditingController categoryController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
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
                  'Add Product',
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
                        height: 10,
                      ),
                      CustomTextField(
                          hintText: 'image', controller: imageController),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hintText: 'Category', controller: categoryController),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomButton(
                        text: 'Add',
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            await ProductCubit.get(context).addProduct(
                                title: nameController.text ,
                                price: priceController.text ,
                                image: imageController.text ,
                                description:
                                    descController.text ,
                                category: categoryController.text);
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
