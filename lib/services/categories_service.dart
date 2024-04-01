import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategoriesServices(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> productList = [];
    for (var i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
