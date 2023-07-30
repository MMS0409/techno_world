import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techno_world/ui/home/widgets/button.dart';
import 'package:techno_world/utils/colors/app_colors.dart';
import 'package:techno_world/utils/images/app_images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController x = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groceries'),
      ),
      body: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 23.h,
            ),
            Center(
              child: Container(
                width: 335.w,
                height: 46.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: Colors.black,
                ),
                child: const Center(
                  child: Text(
                    's',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            NamedCounteiner(title: 'Categories'),
            SizedBox(
              height: 220.h,
              child: ListView(
                controller: x,
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(
                    images.length,
                    (index) => Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          height: 250.h,
                          width: 380.w,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Ready to delevelery',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 17.h,
                            ),
                            Container(
                              height: 28.h,
                              width: 147.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.white)),
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Start Shopping",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 28.h,
            ),
            NamedCounteiner(title: 'See All'),
            Expanded(
              child: GridView.builder(
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) => Container(
                  color: Colors.grey.shade900,
                  child: Image.asset(
                    images[index],
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

List<String> images = [
  AppImages.beverages,
  AppImages.bakery,
  AppImages.vegetables,
  AppImages.fruit,
  AppImages.egg,
  AppImages.frozen,
  AppImages.homeCare,
  AppImages.petCare,
];
