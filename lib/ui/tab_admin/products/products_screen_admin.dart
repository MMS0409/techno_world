import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techno_world/ui/tab_admin/products/sub_screens/product_add_screen.dart';
import '../../../data/models/category/category_model.dart';
import '../../../data/models/product/product_model.dart';
import '../../../providers/category_provider.dart';
import '../../../providers/products_provider.dart';
import '../../tab_client/products/widgets/category_item_view.dart';
import '../../tab_client/products/widgets/product_item_view.dart';

class ProductsScreenAdmin extends StatefulWidget {
  const ProductsScreenAdmin({super.key});

  @override
  State<ProductsScreenAdmin> createState() => _ProductsScreenAdminState();
}

class _ProductsScreenAdminState extends State<ProductsScreenAdmin> {

  String selectedCategoryId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Products Admin"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ProductAddScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),

      body: Column(
        children: [
          StreamBuilder<List<CategoryModel>>(
            stream: context.read<CategoryProvider>().getCategories(),
            builder: (BuildContext context,
                AsyncSnapshot<List<CategoryModel>> snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!.isNotEmpty
                    ? SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryItemView(
                        categoryModel: CategoryModel(
                          categoryId: "",
                          description: "",
                          categoryName: "All",
                          imageUrl: "",
                          createdAt: "",
                        ),
                        onTap: () {
                          setState(() {
                            selectedCategoryId = "";
                          });
                        },
                        selectedId: selectedCategoryId,
                      ),
                      ...List.generate(
                        snapshot.data!.length,
                            (index) {
                          CategoryModel categoryModel =
                          snapshot.data![index];
                          return CategoryItemView(
                            categoryModel: categoryModel,
                            onTap: () {
                              setState(() {
                                selectedCategoryId =
                                    categoryModel.categoryId;
                              });
                            },
                            selectedId: selectedCategoryId,
                          );
                        },
                      )
                    ],
                  ),
                )
                    : const Center(child: Text("Empty!"));
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
          StreamBuilder<List<ProductModel>>(
            stream: context
                .read<ProductsProvider>()
                .getProducts(selectedCategoryId),
            builder: (BuildContext context,
                AsyncSnapshot<List<ProductModel>> snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!.isNotEmpty
                    ? Expanded(
                  child: ListView(
                    children: List.generate(
                      snapshot.data!.length,
                          (index) {
                        ProductModel productModel = snapshot.data![index];
                        return ProductItemView(
                            productModel: productModel);
                      },
                    ),
                  ),
                )
                    : const Center(child: Text("Product Empty!"));
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
