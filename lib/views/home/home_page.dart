import 'package:eshop/controllers/product_controller.dart';
import 'package:eshop/models/product.dart';
import 'package:eshop/views/home/notification_page.dart';
import 'package:eshop/views/home/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/header_widget.dart';
import '../../widgets/product_widget_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductController productController = Get.find();
  var categorySelected = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
           title: const Text(
        'EShop',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
      ),
          actions: [
            IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Navigate to the CartPage
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SearchPage()));
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {
            // Navigate to the CartPage
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationPage()));
          },
        ),

        ],),

        SliverToBoxAdapter(
          child: _buildBody(context),
        )
      ],
      ),
    );
  }



  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            headerWidget(context),
            Row(
              children: [
                const Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton(onPressed: () {}, child: const Text("View all"))
              ],
            ),
           Obx((){
            if (productController.isLoaded.value == false) {
              return const CircularProgressIndicator();
            }
            return   SizedBox(
              height: 30,
              child: ListView.builder(
                  itemCount: productController.categoryData.value!.categories.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    String category = productController.categoryData.value!.categories[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: ChoiceChip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        label: Text(category),
                        selected: categorySelected == index,
                        
                        onSelected: (value) {
                          setState(() {
                            categorySelected = index;
                            if(categorySelected == 0){
                             productController.fetchProducts();
                            }else if(categorySelected != 0){
                              productController.fetchProductByCategory(category);
                            }
                          });
                        },
                      ),
                    );
                  }),
            );

           }),
             SizedBox(
              height: 10,
            ),
            Obx(() {
              if (productController.isLoaded.value == false) {
                return const CircularProgressIndicator();
              }
              return SizedBox(
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: productController.productData.value!.products.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            childAspectRatio: 0.85),
                    itemBuilder: (context, index) {
                      Product product = productController.productData.value!.products[index];
                      return ProdutWidgetCard(product: product,);
                    }),
              );
            })
          ],
        ),
      ),
    );
  }
}
