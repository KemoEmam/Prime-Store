import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/helper/show_snackbar.dart';
import 'package:store_app/helper/update_util.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Update Prodcut',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 170),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  borderColor: Colors.grey,
                  hintText: 'Product Name',
                  onChanged: (data) {
                    productName = data;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  borderColor: Colors.grey,
                  hintText: 'Desciption',
                  onChanged: (data) {
                    desc = data;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  borderColor: Colors.grey,
                  hintText: 'Price',
                  textInputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  borderColor: Colors.grey,
                  hintText: 'Image',
                  onChanged: (data) {
                    image = data;
                  },
                ),
                const SizedBox(height: 55),
                CustomButton(
                  label: 'Update',
                  textColor: Colors.white,
                  buttonColor: Colors.lightBlue,
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await UpdateUtil().updateProductMethod(
                          product, productName, price, desc, image);
                      showSnackBar(context, 'Updated!');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> newMethod(ProductModel product) async {
  //    await UpdateProductService().updateProduct(
  //       id: product.id,
  //       title: productName == null
  //           ? product.title
  //           : productName!,
  //       price:
  //           price == null ? product.price.toString() : price!,
  //       desc: desc == null ? product.description : desc!,
  //       image: image == null ? product.image : image!,
  //       category: product.category);
  // }
}
