import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:techno_world/providers/product_provider.dart';
import 'package:techno_world/ui/auth/widgets/global_text_fields.dart';
import 'package:techno_world/ui/home/admin/add_category/upload_img.dart';
import 'package:techno_world/ui/home/admin/add_products/widgets/addButton.dart';
import 'package:techno_world/ui/home/admin/add_products/widgets/select_cat.dart';

class Addproducts extends StatefulWidget {
  const Addproducts({super.key});

  @override
  State<Addproducts> createState() => _AddproductsState();
}

class _AddproductsState extends State<Addproducts> {
  XFile? _imageFile;
  String? _imageUrl;
  String? catID;

  Future<void> _pickImage() async {
    XFile? pickedFile = await pickImage();
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Future<void> _uploadImage() async {
    String? downloadUrl = await uploadImageToFirebase(_imageFile);
    setState(() {
      _imageUrl = downloadUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Products"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: ListView(
          children: [
            SizedBox(height: 10.h),
            GlobalTextField(
                hintText: "Add Product name",
                textAlign: TextAlign.start,
                controller:
                    context.read<ProductsProvider>().ProductsNamecontroller, keyboardType: TextInputType.text, textInputAction: TextInputAction.done,),
            SizedBox(height: 10.h),
            GlobalTextField(
                hintText: "Add Product count",
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
                controller:
                    context.read<ProductsProvider>().ProductsCountcontroller, textInputAction: TextInputAction.done,),
            SizedBox(
              height: 10.h,
            ),
            GlobalTextField(
                hintText: "Add Product description",
                textAlign: TextAlign.start,
                controller:
                    context.read<ProductsProvider>().ProductsDesccontroller, keyboardType: TextInputType.text, textInputAction: TextInputAction.done,),
            SizedBox(
              height: 10.h,
            ),
            GlobalTextField(
                keyboardType: TextInputType.number,
                hintText: "Add Product Price",

                textAlign: TextAlign.start,
                controller:
                    context.read<ProductsProvider>().ProductsPricecontroller, textInputAction: TextInputAction.next,),
            SizedBox(
              height: 10.h,
            ),
            GlobalTextField(
                hintText: "Add Product Currency",
                textAlign: TextAlign.start,
                controller: context
                    .read<ProductsProvider>()
                    .ProductsCurrencycontroller, keyboardType: TextInputType.text, textInputAction: TextInputAction.done,),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return CategorySelectionWidget(
                          onCategorySelected: (p0) {
                            setState(() {
                              catID = p0;
                            });
                          },
                        );
                      },
                    );
                  },
                  child: const Text(
                    "Choose Category",
                  ),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                  ),
                  onPressed: () async {
                    await _pickImage();

                    await _uploadImage();
                  },
                  child: const Text('Upload Image'),
                ),
                const SizedBox(width: 20),
                if (_imageFile != null)
                  Image.file(
                    File(
                      _imageFile!.path,
                    ),
                    height: 70,
                  ),
              ],
            ),
            AddProductButton(
              imageUrl: _imageUrl,
              catId: catID,
            ),
          ],
        ),
      ),
    );
  }
}
