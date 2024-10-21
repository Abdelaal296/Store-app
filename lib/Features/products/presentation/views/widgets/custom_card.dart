import 'package:flutter/material.dart';
import 'package:store_app/Features/products/data/models/product_model.dart';

class CustomCard extends StatelessWidget {
   CustomCard({
    required this.product,
    super.key,
  });

  ProductModel product ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.pushNamed(context, 'updatePage',arguments: product);
      }),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
          
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: const Offset(10, 10),
                
              ),
              ]
            ),
            child:  Card(
             elevation: 10.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16,color:Colors.grey,)),
                    SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children:[
                      Text(r'$''${product.price.toString()}',style: TextStyle(fontSize: 16),),
                      Row(
                        children: [
                          Text(product.rating!.rate.toString()),
                          Icon(Icons.star,color: Color.fromARGB(255, 240, 222, 58),),
                        ],
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),
        Positioned(
          right: 35,
          top: -60,
          child:Image.network(product.image,height: 100,width: 80,) ,
          ),
        ],
      ),
    );
  }
}
