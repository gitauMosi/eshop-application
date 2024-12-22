import 'package:eshop/models/product.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FavouriteCardWidget extends StatelessWidget {
  Product product;
   FavouriteCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ]),
          child: Row(
            children: [

              Container(
                width: 130,
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                  image: DecorationImage(image: NetworkImage(product.image))
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(product.title,maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      SizedBox(height: 4,),
                      Text(product.brand, maxLines: 2, overflow: TextOverflow.ellipsis,),
                      Text(product.model, maxLines: 1, overflow: TextOverflow.ellipsis,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Text("\$80", style: TextStyle(fontWeight: FontWeight.bold),),
                      
                         ElevatedButton(onPressed: (){},
                         style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          padding: EdgeInsets.all(6)
                         ), child: Text("Buy", style: TextStyle(color: Colors.white),))
                  
                        ],
                      )
                    ],
                  ),
                ),
              )


            ],
          ),
    );
  }
}
