import 'package:eshop/models/category.dart';
import 'package:eshop/models/product.dart';
import 'package:http/http.dart' as http;

String baseUrl = "https://fakestoreapi.in/api/";

class ApiServices {

  /// Fetches all products from the API.
  ///
  /// Returns a [Future] that completes with a [ProductData] object containing the list of products.
  /// If the request fails, the future completes with an error.
  static Future<ProductData> getAllProducts() async{

     Uri url = Uri.parse("$baseUrl/products");
     try {
       http.Response response = await http.get(url);
       if (response.statusCode == 200) {
         return productDataFromJson(response.body);
       } else {
         throw Exception('Failed to load product data');
       }
     } catch (e){
       throw Exception('Error fetching jobs: $e');
     }
  }

  /// Fetches all categories from the API.
  ///
  /// Returns a [Future] that completes with a [CategoryData] object containing the list of categories.
  /// If the request fails, the future completes with an error.
  static Future<CategoryData> getCategoryData() async {
     Uri url = Uri.parse("$baseUrl/products/category");
     try {
       http.Response response = await http.get(url);
       if (response.statusCode == 200) {
         return categoryDataFromJson(response.body);
       } else {
         throw Exception('Failed to load category data');
       }
     } catch (e){
       throw Exception('Error fetching categories: $e');
     }
  }


  /// Fetches all products from a specific category from the API.
  ///
  /// [category] The category for which to fetch products.
  ///
  /// Returns a [Future] that completes with a [ProductData] object containing the list of products.
  /// If the request fails, the future completes with an error.
  static Future<ProductData> getProductByCategory(String category) async {
    Uri url = Uri.parse("$baseUrl/products/category?type=$category");
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        return productDataFromJson(response.body);
      } else {
        throw Exception('Failed to load product data for category: $category');
      }
    } catch (e){
      throw Exception('Error fetching products for category: $category, $e');
    }
  }

}