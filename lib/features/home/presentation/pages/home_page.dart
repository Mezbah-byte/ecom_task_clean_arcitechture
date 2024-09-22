import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_task/core/utils/appColor.dart';
import 'package:ecom_task/features/home/presentation/pages/category_widget.dart';
import 'package:ecom_task/features/home/presentation/pages/product_view_grid.dart';
import 'package:ecom_task/features/home/presentation/pages/slider_widget.dart';
import 'package:ecom_task/features/widget/appBar.dart';
import 'package:ecom_task/features/widget/productWidget.dart';
import 'package:ecom_task/features/widget/shimmerLoading.dart';
import 'package:ecom_task/features/widget/singleProductWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar:
          appbarWithoutBackbutton(context: context, title: "Home", actions: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            Icons.shopping_cart,
            color: ColorResources.white,
            size: 20,
          ),
        )
      ]),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.error.isNotEmpty) {
          return Center(child: Text(controller.error.value));
        }

        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: MediaQuery.of(context).padding.top + 20,
              // ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Get.toNamed(
                          //     RouteHelper.getSearchScreenRoute());
                        },
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: ColorResources.grey777.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.search,
                                color: ColorResources.black,
                                size: 18,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Search'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: ColorResources.newBg,
                              borderRadius: BorderRadius.circular(50)),
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.settings,
                            color: ColorResources.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 150, child: SlidersWidgets(controller: controller)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text('Categories',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              CategoryWidget(controller: controller),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text('Top Deals',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              todaysDeal(controller),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text('Featured Products',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: StaggeredGridView(
                  homeController: controller,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget todaysDeal(HomeController controller) {
    return SizedBox(
      height: 240,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.todaysDeal.length,
          itemBuilder: (context, index) {
            final product = controller.todaysDeal[index];
            return SingleProductWidget(product: product);
          },
        ),
      ),
    );
  }
}
