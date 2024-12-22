import 'package:eshop/controllers/product_controller.dart';
import 'package:eshop/models/product.dart';
import 'package:eshop/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/cart_card_widget.dart';

class CartPage extends StatelessWidget {
   CartPage({super.key});

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: 
        Obx((){
      if(productController.isLoaded.value == false){
        return Center(child: CircularProgressIndicator());
      }
     return Column(
          children: [
            
            _buildCartItems(),
            SizedBox(height: 5,),
            _buildTotalCost(),
          ],
        );
        })
      ),
    );
  }

  Widget _buildCartItems() {
    return SizedBox(
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          Product product = productController.productData.value!.products[index];
              return CustomCartCard(product: product,);
        }),
    );
    
  }

  Widget _buildTotalCost() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Subtotal:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              "\$1214.00",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              "\$10.00",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Discount:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              "10%",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              "\$1220.00",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        CustomBtn(name: "Check Out", function: () {})
      ],
    );
  }
}


