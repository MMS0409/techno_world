import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:techno_world/data/models/category/category_model.dart';
import 'package:techno_world/providers/categories_provider.dart';
import 'package:techno_world/ui/auth/widgets/global_text_fields.dart';
import 'package:techno_world/ui/home/admin/add_category/upload_img.dart';

class UpdateCategory extends StatefulWidget {
  UpdateCategory({super.key, required this.categoryModel});
  CategoryModel categoryModel;

  @override
  State<UpdateCategory> createState() => _UpdateCategoryState();
}

class _UpdateCategoryState extends State<UpdateCategory> {
  XFile? _imageFile;
  String? _imageUrl;

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

  textInit() {
    context.read<CategoryProvider>().categoryNamecontroller.text =
        widget.categoryModel.categoryName;
    context.read<CategoryProvider>().categoryDesccontroller.text =
        widget.categoryModel.description;
  }

  @override
  void initState() {
    textInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category Update"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: ListView(
          children: [
            SizedBox(height: 10.h),
            GlobalTextField(
                hintText: "Add Category name",
                textAlign: TextAlign.start,
                controller:
                    context.read<CategoryProvider>().categoryNamecontroller, textInputAction: TextInputAction.next, keyboardType: TextInputType.text,),
            SizedBox(
              height: 10.h,
            ),
            GlobalTextField(
                hintText: "Add Category description",
                textAlign: TextAlign.start,
                controller:
                    context.read<CategoryProvider>().categoryDesccontroller, keyboardType: TextInputType.text, textInputAction: TextInputAction.next,),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black),
              ),
              onPressed: () {
                print(_imageUrl);
                if (context
                        .read<CategoryProvider>()
                        .categoryNamecontroller
                        .text
                        .isNotEmpty &&
                    context
                        .read<CategoryProvider>()
                        .categoryDesccontroller
                        .text
                        .isNotEmpty &&
                    _imageUrl != null) {
                  context.read<CategoryProvider>().updateCategory(
                        context: context,
                        categoryModel: CategoryModel(
                          categoryId: widget.categoryModel.categoryId,
                          categoryName: context
                              .read<CategoryProvider>()
                              .categoryNamecontroller
                              .text,
                          description: context
                              .read<CategoryProvider>()
                              .categoryDesccontroller
                              .text,
                          imageUrl: _imageUrl!,
                          createdAt: DateTime.now().toString(),
                        ),
                      );
                }
              },
              child: const Text(
                "Update Category",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
