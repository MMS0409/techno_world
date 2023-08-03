import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techno_world/ui/tab_client/products/widgets/category_item_view.dart';
import 'package:techno_world/ui/tab_client/products/widgets/product_detail.dart';
import 'package:techno_world/utils/ui_utils/shimmer_photo.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/models/category/category_model.dart';
import '../../../data/models/product/product_model.dart';
import '../../../providers/category_provider.dart';
import '../../../providers/products_provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String selectedCategoryId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products Client"),
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
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: StreamBuilder<List<ProductModel>>(
                            stream: context
                                .read<ProductsProvider>()
                                .getProducts(selectedCategoryId),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<ProductModel>> snapshot) {
                              if (snapshot.hasData) {
                                return snapshot.data!.isNotEmpty
                                    ? GridView(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 10,
                                                crossAxisSpacing: 10,
                                                childAspectRatio: 0.6),
                                        children: [
                                          ...List.generate(
                                              snapshot.data!.length, (index) {
                                            ProductModel productModel =
                                                snapshot.data![index];
                                            return ZoomTapAnimation(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductDetailScreen(
                                                            argumentsList: [
                                                          productModel,
                                                          index,
                                                        ]),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(16),
                                                    color: Colors.black),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Hero(
                                                      tag: index,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            const BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16)),
                                                        child: CachedNetworkImage(
                                                          height: 160,
                                                          width: 175,
                                                          fit: BoxFit.fill,
                                                          imageUrl: productModel.productImages.first,
                                                          placeholder: (context, url) =>
                                                              const ShimmerPhoto(),
                                                          errorWidget: (context, url, error) => const Icon(
                                                                  Icons.error,color: Colors.red,),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          productModel
                                                              .productName,
                                                          style: const TextStyle(
                                                              fontSize: 22,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        const SizedBox(height: 5),
                                                        Text(
                                                          productModel
                                                              .description,
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        const SizedBox(
                                                            height: 5),
                                                        Text(
                                                          "Price: ${productModel.price} ${productModel.currency}",
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        const SizedBox(
                                                            height: 5),
                                                        Text(
                                                          "Count: ${productModel.count}",
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          })
                                        ],
                                      )
                                    : const Center(
                                        child: Text(
                                          "Product Empty!",
                                          style: TextStyle(
                                              fontSize: 32,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      );
                              }
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              }
                              return const Center(
                                  child: CircularProgressIndicator());
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
