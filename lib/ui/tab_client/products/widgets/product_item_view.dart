import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/product/product_model.dart';
import '../../../../utils/ui_utils/shimmer_photo.dart';


class ProductItemView extends StatelessWidget {
  const ProductItemView({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      padding: const EdgeInsets.all(10),
      // width: double.infinity,
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black
      ),
      child: Column(
        children: [
          CachedNetworkImage(
          imageUrl: productModel.productImages[0],
            placeholder: (context, url) => const ShimmerPhoto(),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error, color: Colors.red),
            width: 180.w,
            fit: BoxFit.cover
          ),
          Text(productModel.productName)
        ],
      ),
    );
  }
}
