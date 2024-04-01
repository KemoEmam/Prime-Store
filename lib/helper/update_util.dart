import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/update_product_service.dart';

class UpdateUtil {
  Future<void> updateProductMethod(
      ProductModel product, String? productName, price, desc, image) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productName ?? product.title,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
