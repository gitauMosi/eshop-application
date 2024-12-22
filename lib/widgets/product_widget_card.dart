import 'package:eshop/models/product.dart';
import 'package:eshop/views/home/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProdutWidgetCard extends StatelessWidget {
  Product product;
  ProdutWidgetCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>ProductDetailsPage(product: product));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor
        ),
        child: Column(
          children: [
            Stack(children: [
              Image.network(
                product.image,
                height: 150,
                
              ),
              Positioned(
                  right: 0,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.favorite_outline)))
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text('\$${product.price}'),
                    const Spacer(),
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 13,
                        ),
                        Text(
                          "4.4",
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
