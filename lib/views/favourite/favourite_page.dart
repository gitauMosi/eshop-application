import 'package:eshop/controllers/product_controller.dart';
import 'package:eshop/models/product.dart';
import 'package:eshop/widgets/favourite_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritePage extends StatelessWidget {
  FavouritePage({super.key});

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              floating: true,
              title: Text(
                "Favourites",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              centerTitle: true,
            ),
            SliverToBoxAdapter(
              child: _buildBody(),
            )
          ],
        ));
  }

  Padding _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        itemCount: productController.productData.value!.products.length,
        shrinkWrap: true, // Allows the ListView to take only the space it needs
        physics:
            const NeverScrollableScrollPhysics(), // Prevents nested scrolling
        itemBuilder: (context, index) {
          Product product =
              productController.productData.value!.products[index];
          return FavouriteCardWidget(product: product);
        },
      ),
    );
  }
}
