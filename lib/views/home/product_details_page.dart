import 'package:eshop/models/product.dart';
import 'package:eshop/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductDetailsPage extends StatelessWidget {
  Product product;
   ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_outline),
            onPressed: () {
              
            },
          ),
           IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
             
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product.brand, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("\$${product.price}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Description:",  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),
            Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product.description, style: TextStyle( fontSize: 18),),
                ),
                SizedBox(height: 100,)
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomBtn(name: "Add Cart", function: (){})
          ],
        ),
      ),
    );
  }
}