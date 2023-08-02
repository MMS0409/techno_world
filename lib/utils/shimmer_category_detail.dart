import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerCategoryIdScreen extends StatelessWidget {
  const ShimmerCategoryIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor:  Colors.grey,
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 1, color: Colors.black),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 7,
                                spreadRadius: 1,
                                offset: const Offset(3, 3),
                              )
                            ]),
                        child: const Column(
                          children: [
                          ],
                        ));
                  },
                ),
              ),
            ],
          )
      ),
    );
  }
}