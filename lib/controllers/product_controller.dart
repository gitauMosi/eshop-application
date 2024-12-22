import 'package:eshop/models/category.dart';
import 'package:eshop/models/product.dart';
import 'package:eshop/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productData = Rxn<ProductData>();
  var categoryData = Rxn<CategoryData>();

  RxBool isLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      productData.value = await ApiServices.getAllProducts();
      isLoaded.value = true;
    } catch (error) {
      print(error);
      isLoaded.value = false;
      Get.showSnackbar(
        const GetSnackBar(
          title: "Error",
          message: 'Something went Wrong',
          icon: Icon(Icons.dangerous),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  void fetchCategories() async{
    try {
      categoryData.value = await ApiServices.getCategoryData();
      categoryData.value!.categories.insert(0, "All");
      isLoaded.value = true;
    } catch (error) {
      print(error);
      isLoaded.value = false;
      Get.showSnackbar(
        const GetSnackBar(
          title: "Error",
          message: 'Something went Wrong',
          icon: Icon(Icons.dangerous),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  void fetchProductByCategory(String category) async{
    try {
      productData.value = await ApiServices.getProductByCategory(category);
      isLoaded.value = true;
    } catch (error) {
      print(error);
      isLoaded.value = false;
      Get.showSnackbar(
        const GetSnackBar(
          title: "Error",
          message: 'No product found',
          snackPosition: SnackPosition.TOP,
          borderRadius: 16,
          margin: EdgeInsets.all(8.0),
          backgroundColor: Colors.redAccent,
          icon: Icon(Icons.dangerous),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
